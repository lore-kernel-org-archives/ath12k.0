Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4A7C4451C
	for <ath12k@archiver.kernel.org>; Wed, 22 Jul 2026 07:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYPuVbYh7RG+NgL76jrvVCtnrENvIPOjy5CVFpCp0MI=; b=QhgQJSlCsR9PXsfz12dBApOYS+
	2L0mkJLE38qqTScTjfgu/gdH8Qpe6U3GxRQdhPyjPGuEmhOwfZcw3pdoB6uAyNGWoIo9SAy0G/GmG
	9NSrQdwrFTStvkNbwiNZJXRyYlvyRUkz12FakOtONxmIyEb6YDzHswlfZXQxybe1eVta/xSE1jmtr
	0zlZX/Z/80FgaOutpHrP03ksNNQKLrmxZcizxLAxImBta44u2NiLYpjRYEXmbgDhN/X0zvV++Nyf/
	UxVlfMadM2dqVbL0VPXiLHUHTbhNodc6K1J0+ojDoHQqE92M0284IV6imeEKdabRC1To3ISKDgXdt
	rL+qyhzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRFp-0000000B3QZ-2OXo;
	Wed, 22 Jul 2026 07:20:33 +0000
Received: from mail.as201155.net ([185.84.6.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRFm-0000000B3QB-1KHd
	for ath12k@lists.infradead.org;
	Wed, 22 Jul 2026 07:20:31 +0000
Received: from webmail.newmedia-net.de (smtps.newmedia-net.de [IPv6:2a05:a1c0:0:de::167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.as201155.net (Postfix) with ESMTPS id 94C3ADFC62;
	Wed, 22 Jul 2026 09:20:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com; s=mikd;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID; bh=aYPuVbYh7RG+NgL76jrvVCtnrENvIPOjy5CVFpCp0MI=;
	b=RdRiybVtdpLfNOFep2n4TSYrFjN6j7wHbIoYqBctOCXyHA4y9DCnvqgTABXTte7VW8eaVLpyR+V5jZGiJW7ZiJchUn83XRXwG2IohSCY4IIOGfGggXWwMxqgU4sGjbRwp0ZiX2eszf7n2xOD1bljGgT8gUH67qXigS0llBL+dOA=;
Message-ID: <9249a5ed-2da0-432b-a430-15bd5bb16215@dd-wrt.com>
Date: Wed, 22 Jul 2026 09:20:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH ath-next 0/6] wifi: ath12k: Add driver support for WDS
 mode
To: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
 ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
In-Reply-To: <20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass (webmail.newmedia-net.de: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=s.gottschall@dd-wrt.com; helo=webmail.newmedia-net.de;
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: s.gottschall@dd-wrt.com
X-SA-Exim-Scanned: No (on webmail.newmedia-net.de); SAEximRunCond expanded to false
X-NMN-MailScanner-Information: Please contact the ISP for more information
X-NMN-MailScanner-ID: 1wmRFf-000D5l-Lp
X-NMN-MailScanner: Found to be clean
X-NMN-MailScanner-From: s.gottschall@dd-wrt.com
X-Received: from localhost ([127.0.0.1] helo=webmail.newmedia-net.de)
	by webmail.newmedia-net.de with esmtp (Exim 4.72)
	(envelope-from <s.gottschall@dd-wrt.com>)
	id 1wmRFf-000D5l-Lp; Wed, 22 Jul 2026 09:20:23 +0200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_002030_572937_DC0D0936 
X-CRM114-Status: GOOD (  11.16  )
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


Am 25.05.2026 um 13:09 schrieb Tamizh Chelvam Raja:
> This patch series introduces support for WDS in the driver by adding
>
> Handling of 4-address frame formats required for WDS operation.
> Proper setting of peer 4-address WMI param to ensure correct transmission
> and reception of multicast and unicast frames in WDS mode.
> Conversion of eth offload Rx frame to 802.11 frame for mac80211 to
> detect 4address frame and initiate AP_VLAN creation.
>
> Tamizh Chelvam Raja (6):
>    wifi: ath12k: Set WDS vdev parameter for 4-address station interface
>    wifi: ath12k: Add support for 4-address mode
>    wifi: ath12k: Add 4-address mode support for eth offload
>    wifi: ath12k: Add support for 4-address NULL frame handling
>    wifi: ath12k: Add support for 4-address frame notification
>    wifi: ath12k: Handle 4-address EAPOL frames from WBM error path
>
it should be mentioned that his feature only works with latest official 
WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1 firmware. i tested 1.7. series 
from qca networking tree and this firmware is missing the wds nullfunc 
service feature. so it seem that 1.6-01243 just added wds support and no 
other firmware will work with it.

regards, Sebastian Gottschall


