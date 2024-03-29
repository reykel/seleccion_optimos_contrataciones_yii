<?php
/**
 *## TbMenu class file.
 *
 * @author Christoffer Niska <ChristofferNiska@gmail.com>
 * @copyright Copyright &copy; Christoffer Niska 2012-
 * @license [New BSD License](http://www.opensource.org/licenses/bsd-license.php) 
 */

Yii::import('ext.bootstrap.widgets.TbBaseMenu');

/**
 * Bootstrap menu.
 *
 * @see <http://twitter.github.com/bootstrap/components.html#navs>
 *
 * @package booster.widgets.navigation
 */
class TbMenu extends TbBaseMenu {
	
	// Menu types.
	const TYPE_TABS = 'tabs';
	const TYPE_PILLS = 'pills';
	const TYPE_LIST = 'list';
	const TYPE_NAVBAR = 'navbar';

	/**
	 * @var string the menu type.
	 *
	 * Valid values are 'tabs', 'pills', or 'list'.
	 */
	public $type;

	/**
	 * @var string|array the scrollspy target or configuration.
	 */
	public $scrollspy;

	/**
	 * @var boolean indicates whether the menu should appear vertically stacked.
	 */
	public $stacked = false;
	
	/**
	 * @var boolean indicates whether the menu should be justified.
	 */
	public $justified = false;
	

	/**
	 * @var boolean indicates whether dropdowns should be dropups instead.
	 */
	public $dropup = false;

	/**
	 *### .init()
	 *
	 * Initializes the widget.
	 */
	public function init() {
		
		parent::init();

		$classes = array('nav');

		$validTypes = array(self::TYPE_TABS, self::TYPE_PILLS, self::TYPE_LIST, self::TYPE_NAVBAR);

		if (isset($this->type) && in_array($this->type, $validTypes)) {
			$classes[] = $this->type === self::TYPE_NAVBAR ? 'navbar-nav' : 'nav-' . $this->type;
		}

		if ($this->stacked && $this->type !== self::TYPE_LIST) {
			$classes[] = 'nav-stacked';
		}
		
		if ($this->justified && $this->type !== self::TYPE_LIST) {
			$classes[] = 'nav-justified';
		}

		if ($this->dropup === true) {
			$classes[] = 'dropup';
		}

		if (isset($this->scrollspy)) {
			$scrollspy = is_string($this->scrollspy) ? array('target' => $this->scrollspy) : $this->scrollspy;
			$this->widget('booster.widgets.TbScrollSpy', $scrollspy);
		}

		if (!empty($classes)) {
			$classes = implode(' ', $classes);
			if (isset($this->htmlOptions['class'])) {
				$this->htmlOptions['class'] .= ' ' . $classes;
			} else {
				$this->htmlOptions['class'] = $classes;
			}
		}
	}

	/**
	 *### .getDividerCssClass()
	 *
	 * Returns the divider css class.
	 *
	 * @return string the class name
	 */
	public function getDividerCssClass() {
		
		return (isset($this->type) && $this->type === self::TYPE_LIST) ? 'nav-divider' : 'divider-vertical';
	}

	/**
	 *### .getDropdownCssClass()
	 *
	 * Returns the dropdown css class.
	 *
	 * @return string the class name
	 */
	public function getDropdownCssClass() {
		
		return 'dropdown';
	}

	/**
	 *### .isVertical()
	 *
	 * Returns whether this is a vertical menu.
	 *
	 * @return boolean the result
	 */
	public function isVertical() {
		
		return isset($this->type) && $this->type === self::TYPE_LIST;
	}
}
