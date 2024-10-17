Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61152D2F7FA
	for <ath12k@archiver.kernel.org>; Thu, 17 Oct 2024 07:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4eEYHr5HZdR14z2m0HhKfVxLLSkjgYI0qJOJpkvDww=; b=mxHiPcIoXqnFp9ZdZX+F5mgNxL
	1sA+uoWXnriPYMtkmMWsspvbr3yKO5aMLBMMhnUvSTA+trtHZHyTYpd0N9+mffkYWLHQuvSj0OORF
	tKTAVJaVxVm7zKy77BfBRH4KwJ10k3BgUmc82X2wi9Bb5AJqN9IjdShtHWxpAGzz1Pnjl0/h3aJpE
	6V/AeCa4sAThyPksyNqOCQX/y+HhdTc3hr9wo4mgQ/oB39K8ehLo+Wj6m3eypMU4ljSxjfl9GTtR9
	dOha+CX08PI+IzYxdqnAQHwxSdZDd1AuSsv5XbQYMdVauVRfUqtnlSAcZEjipLN9zNNW5+V6vvQCN
	doMhZWAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1L6c-0000000E0dV-4C84
	for ath12k@archiver.kernel.org;
	Thu, 17 Oct 2024 07:39:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1L6Z-0000000E0d0-2O48
	for ath12k@lists.infradead.org;
	Thu, 17 Oct 2024 07:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729150770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m4eEYHr5HZdR14z2m0HhKfVxLLSkjgYI0qJOJpkvDww=;
	b=SRR7yUhKxlaNfa03by5qBnaPkiogNCxPp5SZWz5QqFQ8FjRGA83s1FFNxQ9YB3jrSnyaua
	YlHLWNssS9L3Gc01g+5o+55phdk/38Qz8KFjh0rT11lKRewZOa/WiNVCYDGnPZbz+TEQeI
	/zfyyGHux/bGTx7jVp6u4rg6cOqnijw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-375-hZvoJQuhPv-T_dST5p10zA-1; Thu,
 17 Oct 2024 03:39:26 -0400
X-MC-Unique: hZvoJQuhPv-T_dST5p10zA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7AD7919560AB;
	Thu, 17 Oct 2024 07:39:25 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.60.16.52])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 461B8300018D;
	Thu, 17 Oct 2024 07:39:21 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: quic_jjohnson@quicinc.com
Cc: ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] wifi: ath12k: fix crash when unbinding
Date: Thu, 17 Oct 2024 09:39:17 +0200
Message-ID: <20241017073920.176412-1-jtornosm@redhat.com>
In-Reply-To: <7edcf090-ac17-45de-a81e-33a1bb520126@quicinc.com>
References: <7edcf090-ac17-45de-a81e-33a1bb520126@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_003931_699008_B2DAC9BF 
X-CRM114-Status: GOOD (  16.79  )
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

> I still don't understand why this check is necessary.
>
> Why isn't just adding the "dp->tx_ring[i].tx_status = NULL" inside the loop
> sufficient?
>
> You previously wrote the "warning comes from free_large_kmalloc". Is that
> warning due to a NULL pointer, or due to a double free?
>
> I don't see how it could be from a NULL pointer since in kfree() the 1st thing
> it does is trace the entry, but then the 2nd thing it does is return "if
> (unlikely(ZERO_OR_NULL_PTR(object)))"
>
> So I'm suspecting a double free, and setting dp->tx_ring[i].tx_status = NULL
> should fix that issue.
Sorry, I didn't understand you at the beginning and I thought that you were
referring to the complete fix (including setting to NULL). You are right, it
is a double free and the test is not necessary, just set to NULL after
freeing.

Thanks

Best regards
José Ignacio


