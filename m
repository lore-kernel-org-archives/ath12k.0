Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF29CA600D
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 17:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6hPxpHc+iRxO8pwwK1MgBKqJXYkCI7uIoX2LKQBJPI=; b=XGf0V78aLvJGYFRhWqHAR2oTAB
	Y3OL6vXsr/REb4Lgr8NIBhLKxQ4F2eqPY6sUu541nwsbjiI3+WTKVksRzyJ2NuxApFi0p+KoXtyC0
	lid/8JOqmif03l9qhbUIv3ntgOj0MtQUGYPXh4zULnXtkVOk3/fEuUOUofkhlV/UQGi/JDLfAoQHD
	zV8P8/eC/TF0+/yOc1XzkKbZpKO4sedD9HVN1bSVj/IV1N5YFvoUjHEFqyNpmUDxWwPMv5y0k4dyk
	EuAG8taYFguAvNuJOA0SWEx6nO1wzjWhK72qSAdal6xAzDDlNJp/JxuY2kSICteEcBKbSNDnHAUA+
	KYO/RIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEs4T-00000004nWU-1woM;
	Thu, 08 Oct 2026 17:38:21 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEs4Q-00000004nVq-3R3m;
	Thu, 08 Oct 2026 17:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791481099; x=1823017099;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=qYtHttXAHlR0qS19Rqv1FhyQJd4hcKVSBJQ7u9dNS94=;
  b=WPLVC1RY08Gm+dsRAlKmSwcFrxkmRu7i0IXdSjNXG+MtPH1lWYx1jpRa
   gReaQBlXxZtYPdx3lRniNe90/kJRI6YCGaisRPd1mhpl1Wv/IR/NphBwD
   5+cVSZncN/kbjPh5x4lf1+FQ4MGmK7U8w0ml9C/7I8c77fCCEnoio5byE
   10HGDBVkKSQlnHLacnlXtC0/B9KbMDDhYnsP6qE9eD+R1sd7Kr2x1qfMY
   NbtWEpEW6TwO45ep+GgLtjhESmUxfm6HzPlyFpfKVtSG2ryObbK0L2Z4c
   zbHfPb+2jSZk616l7O6V/D08sK2aPqBc4JzCXXso5t0OtH+lmgLnSS0sH
   A==;
X-CSE-ConnectionGUID: YRKlv2FFQz+IGMb6vVXU1w==
X-CSE-MsgGUID: xf3QGNJ0Q+6RWPLpKRI2Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="279889"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="279889"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:38:17 -0700
X-CSE-ConnectionGUID: 2nk0g4G0RWmUVNn9tDP8Ow==
X-CSE-MsgGUID: ohFYAAIaTWeXIUq4TpcjJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="1919313"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:38:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, Jeff Johnson <jjohnson@kernel.org>, 
 Hans de Goede <hansg@kernel.org>, Andres Salomon <dilinger@queued.net>, 
 Thomas Gleixner <tglx@kernel.org>, Paul Fox <pgf@laptop.org>, 
 Dan Carpenter <error27@gmail.com>, 
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>, 
 Hyun Kwon <hyun.kwon@xilinx.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
 platform-driver-x86@vger.kernel.org, Jiale Yao <yaojiale02@163.com>
In-Reply-To: <20260926121250.3258285-1-yaojiale02@163.com>
References: <20260926121250.3258285-1-yaojiale02@163.com>
Subject: Re: [PATCH 0/3] debugfs: Reserve space for string terminators
Message-Id: <179148108715.29028.11629364722583143417.b4-ty@b4>
Date: Thu, 08 Oct 2026 20:38:07 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_103818_876959_CE18EFE2 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On Sat, 26 Sep 2026 20:12:47 +0800, Jiale Yao wrote:

> The same boundary mistake appears in three debugfs write handlers. Each
> handler has a zero-initialized buffer and allows a user write to fill the
> entire buffer. That overwrites the only NUL terminator before the input
> is parsed with sscanf(), strsep(), or strcasecmp(), which can then read
> beyond the end of the buffer.
> 
> The write paths are independent, so the fixes are split by file and can
> be applied separately. Each patch reserves one byte for the terminating
> NUL while preserving the normal input size for that handler.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/3] platform/olpc: Reserve space for a string terminator
      commit: 4ef563af57cc48d5a9662d7c69aa4447c2cc1b2c
[2/3] wifi: ath12k: Reserve space for a string terminator
      (no commit info)
[3/3] dmaengine: xilinx: dpdma: Reserve space for a string terminator
      (no commit info)

--
 i.


