Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E0F606A31F
	for <ath12k@archiver.kernel.org>; Tue, 20 Oct 2026 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sb4s+G+5;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L0ezWE83
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1mO6MuWQfpqagLYjVpfTRaUcgdVFipQ47H+IkmGB/Q=; b=Sb4s+G+5E0MOWpbsMFX49EaMK2
	H4eXRDu0rwyKbjtRg7MvtNtN9q+eSPJzqHos6G2rSpB5054V/F4pVsqxkr7d/XTU6TIcS7QFcfNfy
	MVmchmjbxvJJKLfibaUZt7889RY/khHypzXTCGgAFs1mUJ5aG9dgduMkpe9xXP1N3CACmULFJb+0z
	rjHpHhM+x0UZV2uFxvGV5SWE3pB2i8ipIXVPsPO6rD8si++5L32Id8xZse9db3ozRXMytAZeqos+B
	MSo47UHbrU1t1vwV/6prOFlz1HWDozNhpVzvV80kF9QjAPq7USliTz5oRNCdzevU0C0EadHekY2dW
	ddLiEmlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJC1W-0000000A5Pq-2BiS;
	Tue, 20 Oct 2026 15:45:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJC1M-0000000A5Mp-3rIA
	for ath12k@lists.infradead.org;
	Tue, 20 Oct 2026 15:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792511096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i1mO6MuWQfpqagLYjVpfTRaUcgdVFipQ47H+IkmGB/Q=;
	b=L0ezWE83MAGBlKT+xHwjsFwAlaf/lwC/CidT9ZNVQwcm8ks6xS2dyhHMMCglPlAyNcjOVh
	mPFaon8QboBoIOGKZzd9zPXwsMRgEeM9Ikw3ixDir+fhDaQY3EwjTNqsBxfoQxZmqbxuk8
	JvlNv1z4TJcfgphXqdOk2pwXPxTSQIY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-164-wZzDOMMSMDSlMPLuSJEkog-1; Tue,
 20 Oct 2026 11:44:53 -0400
X-MC-Unique: wZzDOMMSMDSlMPLuSJEkog-1
X-Mimecast-MFC-AGG-ID: wZzDOMMSMDSlMPLuSJEkog_1792511092
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B98B618003FD;
	Tue, 20 Oct 2026 15:44:51 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0E8315BC;
	Tue, 20 Oct 2026 15:44:47 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: baochen.qiang@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	johannes@sipsolutions.net,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 1/3] wifi: ath12k: fix MLO station firmware crash recovery
Date: Tue, 20 Oct 2026 17:44:45 +0200
Message-ID: <20261020154446.2131752-1-jtornosm@redhat.com>
In-Reply-To: <4f2a06f4-601b-4e96-826b-a5453bc03ec9@oss.qualcomm.com>
References: <4f2a06f4-601b-4e96-826b-a5453bc03ec9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: xT0Cy2pKkKyQ_hjEus7MzYS_09V8ZEaaSxyoBPnV3jg_1792511092
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_084501_081276_6980562A 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Baochen,

> Johannes doesn't like option 2, let's forget it now. Instead, are you interested in
> (working on) option 1?

I can study option 1, but I think Johannes pointed out that taking
rtnl only around cfg80211_shutdown_all_interfaces() could not work,
so it would mean holding rtnl for the full recovery (~1.3s). It could
be a significant rearchitecture of the recovery path to not take a
lot of time with no response.

>> sense for you to land this series as an interim fix while that is
>> worked out as a follow-up?

> Jeff can make the call.

Jeff and Baochen, in order to get some fix, would you be open to
landing this series while option 1 is worked out as a follow-up?
Happy to continue with this.

Thanks

Best regards
José Ignacio


