Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD3BC9EC8D
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 14:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RzI3iHz1d6s2irGddIZcQpLLuEEX4Apj+iXPS/UdZAk=; b=3HzDOagIPcwowTx6VToszDRc1s
	S1xnvs4stke4tgkyxSQ2cFItwqqhKljmn7CBhxBwiBivFX93DREZJRS7Tc4ellKCBdbx8Cdv1VJgJ
	oAXldvOHrzq6Hri2zNOu1Siyl/S46XNk+btr+9eT4hjzAYqRZ2VIPd/RXyOp2+VceAI4AF3VTuLpd
	Wo09CvIWUY0RG7s0dc6ZleloPqzd4Y6SQsEvvxv3ApGf9ZrkFsoQXj+V9CXOKpyGZyNLXyKR+xvCo
	QzwrXu8VQwguZHQBH4P7GVENFfd29xGfTfygoTnsnwDlvRXS4yDxzn9cjATka0O16H2RrK9cnHcr/
	WcUnC4iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIy7-00000005XJw-1Ysc;
	Mon, 12 Jan 2026 14:32:31 +0000
Received: from host02.bvsystems.com ([67.225.163.68])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIy4-00000005XJ1-3agE
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 14:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bvsystems.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RzI3iHz1d6s2irGddIZcQpLLuEEX4Apj+iXPS/UdZAk=; b=KY18V+gDdDSGPh7uy22uQ4i3/i
	h8xXu6t4LD57RPZOlrAzl862xh/n+v1oDfL/80kxXb6Hpdyz39uMZm/7BXsLXF9MstD/9PAox67Dh
	SAymHfNiBXV96E7WIkoSAkV+y9LKkF+DG62TqmVDx5S73jv+H+hKJby4Jl6YtYtRP9qVPFeORAAcJ
	fLbAV77mMhC3KDK3fdHiMZ1aSs9T6MpkGMcKttwH9LMm6Q3qMgjJHqsI3mWxc6B59EL1B3afeJ2ku
	kUeMRDa4wAGQRVt+fbJgVq2XU7BaIO6jhzneAP6CmBDqrIa2XmrxD02bGHAa0iMuEGNnXHbFb9hS7
	FAibpjVA==;
Received: from ool-18bbd266.static.optonline.net ([24.187.210.102]:49988 helo=MTUMAPC)
	by host02.bvsystems.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <michael@bvsystems.com>)
	id 1vfIc3-0000000BRmb-3o3T;
	Mon, 12 Jan 2026 09:09:43 -0500
From: <michael@bvsystems.com>
To: <ath12k@lists.infradead.org>,
	<kang.yang@oss.qualcomm.com>
Subject: Re: Re: [question] ath12k: support for tx in monitor mode?
Date: Mon, 12 Jan 2026 09:09:37 -0500
Message-ID: <004901dc83cd$1ba53b20$52efb160$@bvsystems.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdyDy6p8ofara7xLTburUhgLiuxuPg==
Content-Language: en-us
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - host02.bvsystems.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bvsystems.com
X-Get-Message-Sender-Via: host02.bvsystems.com: authenticated_id: michael@bvsystems.com
X-Authenticated-Sender: host02.bvsystems.com: michael@bvsystems.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_063228_973515_7B467AC3 
X-CRM114-Status: UNSURE (   4.75  )
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

On 1/11/2026 at 9:50 PM Kang Yang <kang.yang at oss.qualcomm.com> wrote:
> michael at bvsystems.com 於 1/9/2026 11:43 PM 寫道:
> > Hello,
> > 
> > I have a use-case involving transmitting in monitor mode
[trim]
> Hi, if you are asking whether WCN7850 supports TX in monitor mode, my
> answer is: the hardware does support it, but we haven't implemented the
> code.
> 
> Now we don't have any plan on this yet.

Thank you for letting me know, I appreciate the attention to my question.
Please don't hesitate to reach out if there is anything I can do to assist
any future efforts in regard to supporting transmitting in monitor mode.

Sincerely, Michael E. Tuma


