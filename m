Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9D1C88E50
	for <ath12k@archiver.kernel.org>; Mon, 14 Sep 2026 12:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMSmm+qEwdaTOP0e0g3GRGSXbkVVOBn+6DVhN+VKS/g=; b=p0c2sAua23US1ZVmcTpRoQJxxi
	huB2wp+/FWwiEu0kSafH1A+7gpdLC3tM6hokXEONVV19iqO/+Mo4fsRjkhWV+Mw4qKJp1RE0UQCYP
	SO9+whOo65x7PH51x9CbO55QKMwIFhEntPDYCdZe8YFhuho9fun23kqxHC/TfJ4AxDU+acCFVRDSa
	rZoJWTXvzqak78qH91kKr0cRin04HyyCOqsuvEWyy27E9c8uXA7UhAc+lGHmFUHJh16BTVyk/KlV0
	5iaLYH42t/+MHmCiELislADR2I8cEzrjwb3kpFxL7LkrR/FKNRTIGGpdkGepOMP32zZOKahmvF4a6
	GFmBVgvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x665O-00000003dDx-3Led;
	Mon, 14 Sep 2026 12:47:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x665M-00000003dD1-1qT8
	for ath12k@lists.infradead.org;
	Mon, 14 Sep 2026 12:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789390018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMSmm+qEwdaTOP0e0g3GRGSXbkVVOBn+6DVhN+VKS/g=;
	b=M+TH9xOJIxzmi5jS1b9NjKrYdJIhNbgelMNwNIHpl8nIOjNryXZshniX7RE9tgU0ifaLO9
	u3Rxo9aVDu2ySkfdcsbwhPGOZFTAle+XYBN4bdsAmj0PPUtR0KszGt/NmuXKCawuMCNKAo
	Q1oMyJWyKfh7OhtDKwIkHBTDYkDp5X0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-378-NSkAlAn2OcyIQLPrhwE7pA-1; Mon,
 14 Sep 2026 08:46:53 -0400
X-MC-Unique: NSkAlAn2OcyIQLPrhwE7pA-1
X-Mimecast-MFC-AGG-ID: NSkAlAn2OcyIQLPrhwE7pA_1789390011
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 96069180ACD2;
	Mon, 14 Sep 2026 12:46:51 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8F1271956041;
	Mon, 14 Sep 2026 12:46:48 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: bhelgaas@google.com,
	mani@kernel.org
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v13] PCI: Add device-specific reset for Qualcomm devices
Date: Mon, 14 Sep 2026 14:46:47 +0200
Message-ID: <20260914124647.25054-1-jtornosm@redhat.com>
In-Reply-To: <y5wemns4rjjfhaykkgghuyjiqqygx2is3bcyflrclrirp3lqh6@aiwdkaycpvuv>
References: <y5wemns4rjjfhaykkgghuyjiqqygx2is3bcyflrclrirp3lqh6@aiwdkaycpvuv>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: rSMHA-ngpTlVqAX4w3sCpNRCrEKRVc9lsldS3pyYk6k_1789390011
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_054700_556884_AE2BC21F 
X-CRM114-Status: UNSURE (   6.39  )
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

Hi Bjorn,

Friendly ping on this patch, now almost two months old.
It has Mani's Reviewed-by and has been tested over 100+ VM crash/reset
cycles.

The approach was developed following Alex's and Mani's guidance through
the series, using device-specific hardware reset registers.

Without this, Qualcomm WLAN and modem devices cannot be reused after unclean
VM termination in VFIO passthrough.

Could you help me to know if there is anything blocking this in order to
move forward?

Thanks
Jose Ignacio


