Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB7DD1AD4B
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 11:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZE6tSbBnrgSxfs8hfG9pixVaeQvAehA2fgnct8qkbRI=; b=IRXzft3FwHPK6UHagGTliP2v4f
	Y4ZJru1Y9WtP5Rdp55Chr8WEvIyNsvSGpsU3VRBP6/zE00umag4YELG09uYNdVkhtoOrLpmvwT8pZ
	fOBhrzS1CsIZxJrrh1cae2bMUOil6TjELklmKj8RUdb7wpBBOMCbLhE3ZD6Xa6X7ntx+r+fY0U33I
	u/gnBDkWkdAWZDdVW7eWa2FyhNFLZE5QhRXWI7qr/2uI65cdCKTlkF/tTDthAyQLLEw7Tcmcgie1S
	Vou8Xp/7JHC5eMRk7Ml8LjOYgBcppJbc8lOBfAoDFhMCl1tVlvXQ/4V764heic67oaeQsvIQSoWmt
	RBkC/1Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t12e8-0000000BfBc-00BV
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 11:56:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t12ds-0000000Bf7b-06HF
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 11:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729079797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE6tSbBnrgSxfs8hfG9pixVaeQvAehA2fgnct8qkbRI=;
	b=Erm4HOdzYY3NnV8GJhKAYw/3nDDL5wi0JyyjyVb+e+byQmlnUXreXnsqGVbq0jKZSP5ffD
	n7vQTMhSofFhzyrQSbAcX+DYNF2SAMlNN8bDPSsTXQ89ITbrrXZmgEPyyas/fw/OrWPL95
	TGVQTWzDuMGOTtdB8doJzos4KuqNCNw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-213-Pa8X15QgOwyDlrPk5r75DA-1; Wed,
 16 Oct 2024 07:55:44 -0400
X-MC-Unique: Pa8X15QgOwyDlrPk5r75DA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 45F7C195608C;
	Wed, 16 Oct 2024 11:55:42 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.76])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DC7A51955EA4;
	Wed, 16 Oct 2024 11:55:38 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: quic_jjohnson@quicinc.com
Cc: ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] wifi: ath12k: fix warning when unbinding
Date: Wed, 16 Oct 2024 13:55:35 +0200
Message-ID: <20241016115536.204583-1-jtornosm@redhat.com>
In-Reply-To: <2f6f7649-772e-42e6-a762-f2d66b7e3b22@quicinc.com>
References: <2f6f7649-772e-42e6-a762-f2d66b7e3b22@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_045640_182397_236245E7 
X-CRM114-Status: UNSURE (   6.20  )
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

Hello Jeff,

> this test is unnecessary since kfree() already handles NULL
I agree and normally kfree behaves in that way, but in this case the
warning comes from free_large_kmalloc. Unbinding from VMs, the warning is
always happening if the previous crash is fixed (first commit of this
series).

Thanks

Best regards
José Ignacio


