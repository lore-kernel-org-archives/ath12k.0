Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B90AC55182
	for <ath12k@archiver.kernel.org>; Mon,  3 Aug 2026 15:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fwo7ln4mMlWPfTQKRsYazrT8UricXwcCjKeDs9xlLgo=; b=JmBPPpo85oZ3atSuQPmIu7A9vv
	jRCFRLKxHT1vORjcs4EJFnPT79uWOT81pGoA93eZW+WPzCtndAfZDVOdabu3ECIuDDuMh34HkhPJt
	DP7Z6A8mb7T0wX30nJElvOvqEspS95p0LeTq47HNg4K0QvVpbAIk83CAPpSNcrnNdw5Z7IaN4VmSE
	HPCJe7GHE0fJftmifm7IKudRIXFo/7TZNBHvLybhwa+hkidWmKDeHDXFakU2wBPPlfb4Eloe7He/c
	jZ/oFnxKeSgh1X6A8jUg0UcoXyLdniD6jhg6Mycc4I/CFTI9gW/ScIrAXHPtsLPizo6nQhDCo66JY
	Eo5Bmrtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquRW-0000000HVCD-0gHe;
	Mon, 03 Aug 2026 15:19:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquRT-0000000HVAt-1YHT
	for ath12k@lists.infradead.org;
	Mon, 03 Aug 2026 15:19:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785770342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fwo7ln4mMlWPfTQKRsYazrT8UricXwcCjKeDs9xlLgo=;
	b=TUTXpYboX4fUt1fh8W1DUy9ZeYNKxuQ52fI+TIUPEUxHWWbjQM9W3acmmwX3LRc586z1a8
	sBmwmpnJ/uk5iKZORR6/HbXoxXP5gyU4cVr51luxLG69koKjGvYt/UKm87sTY3JdDZd27M
	tzEbauTjAy9YALCu7FCUuxfJVyDTehA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-690-6uoixE_1PSGDw-LxHnr54w-1; Mon,
 03 Aug 2026 11:18:57 -0400
X-MC-Unique: 6uoixE_1PSGDw-LxHnr54w-1
X-Mimecast-MFC-AGG-ID: 6uoixE_1PSGDw-LxHnr54w_1785770336
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2482C19560AE;
	Mon,  3 Aug 2026 15:18:56 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.107])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E435B195608E;
	Mon,  3 Aug 2026 15:18:52 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: baochen.qiang@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 4/5] wifi: ath12k: fix MLO beacon handling using per-link addressing
Date: Mon,  3 Aug 2026 17:18:50 +0200
Message-ID: <20260803151851.29268-1-jtornosm@redhat.com>
In-Reply-To: <87f02c36-6257-4713-8d39-370f575ecd1a@oss.qualcomm.com>
References: <87f02c36-6257-4713-8d39-370f575ecd1a@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 3INcZHbkVfPoOCXys-9UFsFzGevYz8tFo19ApoRckRg_1785770336
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_081903_476710_1D587AAE 
X-CRM114-Status: UNSURE (   5.89  )
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

Ok, since ieee80211_connection_loss() is per-VIF, it makes more sense to
move connection_loss_work from ath12k_link_vif to ath12k_vif.
I will try do like that in v2.

Thanks

Best regards
José Ignacio


