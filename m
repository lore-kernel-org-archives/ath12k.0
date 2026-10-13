Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33576CC6B0E
	for <ath12k@archiver.kernel.org>; Tue, 13 Oct 2026 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvuVUKSrndopolcbkINdeWPhSExNCeI8jvU0JnOyCeY=; b=yfyiWqXVsZAr7zaudjkes4LJCC
	ZdfRWQu4FNe56oVdExfUHdwcDvNHlwz/oWJgRk8J8j9pGrNTGBnN1u3OkL63WCbkv/pYgSqhg3W53
	sammQvCKvqmJ9HbG9ys2cNjXSk6kLsB+5LYbHP+tA44f0ib7jq/D2e8zDDm8i1yk7K/6qSIH6Bdm7
	RSoy1wj7XGuoaR4AdPtxfbFeSLURx8EBtVXocZadOID0CaG8K/q/WOZfKhARf28sy3nbnC0fjhg3P
	jVV5TQtyLeXIiCpUBpLghi3VnTQl6gbUVbrJiH+rs/cIuwpGgeerQeudYrXZnNCf431meWcm762Rt
	WmIy+oKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfcL-0000000DZxB-3ahu;
	Tue, 13 Oct 2026 16:44:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfcH-0000000DZwO-04gj
	for ath12k@lists.infradead.org;
	Tue, 13 Oct 2026 16:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791909879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rvuVUKSrndopolcbkINdeWPhSExNCeI8jvU0JnOyCeY=;
	b=Q7P4lb3YdGCbgVjccuplQ+ewK3gMcxx44ZhocbbuQYg9Irn4LaWXBf37oZVcWa1+q8DVQa
	nZf1bVvZY1dpCpqYpFdU4PyJ/TaHfl7+QrdxUddkVEbOVQLAtJeCfXObRSTuk4QMcoPHXM
	TZjB/xcMTUYlLndz/e0ZyJNlIH8rJFE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-383-1DkudKECO2ya43ctc4eSiQ-1; Tue,
 13 Oct 2026 16:44:37 +0000
X-MC-Unique: 1DkudKECO2ya43ctc4eSiQ-1
X-Mimecast-MFC-AGG-ID: 1DkudKECO2ya43ctc4eSiQ_1791909876
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AE3701944EB2;
	Tue, 13 Oct 2026 16:44:35 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ACA0F30000E6;
	Tue, 13 Oct 2026 16:44:32 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jtornosm@redhat.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 0/3] wifi: ath12k: fixes to improve MLO station stability
Date: Tue, 13 Oct 2026 18:44:09 +0200
Message-ID: <20261013164431.236842-1-jtornosm@redhat.com>
In-Reply-To: <20260804175004.1761075-1-jtornosm@redhat.com>
References: <20260804175004.1761075-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: A6LmqDzkQIaBRce1U-nAIEzrU4RNdSHW5tkaUPpAaKA_1791909876
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_094441_149873_F205D3A1 
X-CRM114-Status: UNSURE (   7.02  )
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

Hi Jeff, Baochen,

Gentle follow-up on this series. Without these fixes, a firmware crash
during an active MLO connection results in NULL pointer dereferences
and 20+ second recovery delays. Non-MLO recovery works fine; this
brings MLO to the same level.

v2 has been on the list since August 4 and addressed all v1 feedback.
Happy to rework if something is pending or can be improved.
I know it is better to not have recoveries, but if there are (I have seen
some), we would be covered in a fast way.

Thanks
 
Best regards
José Ignacio


