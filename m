Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B287CD2F7FA
	for <ath12k@archiver.kernel.org>; Thu, 17 Oct 2024 07:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekjP/+RTxRRpF924txgjW8HefsPRSKOo9PCJDVuif4w=; b=W51ebGt+32V36DPqrYs/tn/ES/
	zz5irGPfU9R+uRxysc0tHsq/FGcKEL+kFZMnMJiaGeXFWQY+4mZEx6QncWxNzdMbwaLq5+faG7Hpf
	KjFTpol3iNrYdaWDb801qMN78rqOtNgIidQ2iZX33YF0OhVuMeKD2JP8orI6W2HXIGDew+CHbf8Vw
	EZBztdWMrnUSVABcZ+UMBUDRXWWGUMNp3g1L+WCUc1ju5QP7cRevSmPmLrx+ve2wZ8OT7wRssJ9P6
	JkeZnFa84cEst8+G2A2CXKkukjHFPy6QqXyAx9cdSCVKKCsSDki4sFrm2U9zZGyFd/MPLlbZBmX7y
	/iy4YYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1L38-0000000E0Eg-0HVK
	for ath12k@archiver.kernel.org;
	Thu, 17 Oct 2024 07:35:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1L32-0000000E0DM-0Qjh
	for ath12k@lists.infradead.org;
	Thu, 17 Oct 2024 07:35:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729150549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ekjP/+RTxRRpF924txgjW8HefsPRSKOo9PCJDVuif4w=;
	b=QcjCSHmWGSRdDrY15cwk3HG2bPaTFW6dSpYjyvRT6FR3pQ/AnkmhZQmrk+ujwSLU5crBdY
	sp4aMa64MBijLc/NJEAEUzQoWwb//WHZ/GDtpCls1Zwf5YfBB1KykRBuOsHWMOgJiAmI2q
	pwgqM0MunUVMrQFy3pgau1mvFdLJUas=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-677--NNdpK-0Plq6hfaZ_JTfCw-1; Thu,
 17 Oct 2024 03:35:45 -0400
X-MC-Unique: -NNdpK-0Plq6hfaZ_JTfCw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 58B241955D91;
	Thu, 17 Oct 2024 07:35:43 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.60.16.52])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1B46D19560A3;
	Thu, 17 Oct 2024 07:35:39 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: quic_jjohnson@quicinc.com
Cc: ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] wifi: ath12k: fix crash when unbinding
Date: Thu, 17 Oct 2024 09:35:37 +0200
Message-ID: <20241017073538.176198-1-jtornosm@redhat.com>
In-Reply-To: <452ec614-7883-4e0f-ae0a-25d22d0be41c@quicinc.com>
References: <452ec614-7883-4e0f-ae0a-25d22d0be41c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_003552_258694_112519C0 
X-CRM114-Status: UNSURE (   7.19  )
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

> FYI I didn't comment on this previously but
> <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#backtraces-in-commit-messages>
> has some guidance on trimming backtraces in commit messages.
Ok, I will trim the backtrace in a next version of the patch.
And I will fix the typos too.

Thanks

Best regards
José Ignacio


