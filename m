Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9739CC44501
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dh24pC1RhR3jWKl6U9WnLTqhHEZRr0wAavb5R/xV1A=; b=EOn5evKMlg65IjTrtWYH2ipKZB
	40U45OsDw6CVYdShlw8FveaMNCWSVICV66savxnMCDFevrz5Oi6VvV3Evfoanfykb24p9jHI2lmtL
	D8hLKUkeqb0G1sSE2jQGcs0jHzzEI/vkRF1tHJVPtrhgH1N+n66cjzDVxWsfQ9mzPWopqxANsXACo
	8/QNx3mVSjevDiLUqFt2Q2mDLL94eUfodw+9+/bBh5Fy/80O+8OZQT8M0Fp1p2sdxpLOIz+AQoILi
	9znmYDeKoEMT189qdozPoolwAHxt5R2WG8nEdoIaiU7C453ji3TZdyCcHEmnmQqa/tN41EyoH5QIT
	PCSyyt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfXl-0000000Cbp2-18dp;
	Tue, 14 Jul 2026 15:59:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfXj-0000000Cbnz-38ME
	for ath12k@bombadil.infradead.org;
	Tue, 14 Jul 2026 15:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1dh24pC1RhR3jWKl6U9WnLTqhHEZRr0wAavb5R/xV1A=; b=OaO8tQiPqQs921X+MX+G0zD01l
	Ml1TgLnUAWypbBAUajqIy62XZNOrnyeefHlSLh3nv740HERNjv5WYLeyeNJXYoo4f+2GeoBAA597L
	T+VCODTSV1TzBBUGEl2XDjTPzsngx9KgviF+bnyQSgnnO9FWAIyo+/yYARXQq2BOzzrzyBpzOz+hC
	nE0TpUy2gY2/SW5a1oOkfKnOL6lZJ4v2PcoNXsmxUbmO0SeT9S5TMZsndL7zMNKdQNUV+5KrN8dBj
	7Ra+YogcfWAe94Shejk9edpn7KX9C3f43qBu/GyQp0YMVBnBAzPvdAvkDxG5XiZgLtq7bGkb4orEF
	CEQ82aYg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjfXg-0000000CfY7-2UQd
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 15:59:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784044768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1dh24pC1RhR3jWKl6U9WnLTqhHEZRr0wAavb5R/xV1A=;
	b=IIFOIVNeXH4aJnXKNz13nuC0SJ0UlnwEA8PIPEoUQYw2rhJkvgtXM9VJ92SYYBj9EfeOsY
	hsBjTlRG1oM9CSV0ca9wq/QNVnB7poQEVmakrnz1EcZPpkp44STgEhC3ZYRO3pzE76D3v6
	HykMEVzLlG4v7SuCai2iTCJzfuKfafQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784044768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1dh24pC1RhR3jWKl6U9WnLTqhHEZRr0wAavb5R/xV1A=;
	b=IIFOIVNeXH4aJnXKNz13nuC0SJ0UlnwEA8PIPEoUQYw2rhJkvgtXM9VJ92SYYBj9EfeOsY
	hsBjTlRG1oM9CSV0ca9wq/QNVnB7poQEVmakrnz1EcZPpkp44STgEhC3ZYRO3pzE76D3v6
	HykMEVzLlG4v7SuCai2iTCJzfuKfafQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-480-lxA7Vp8lMY6uXLc4DMMmaQ-1; Tue,
 14 Jul 2026 11:59:24 -0400
X-MC-Unique: lxA7Vp8lMY6uXLc4DMMmaQ-1
X-Mimecast-MFC-AGG-ID: lxA7Vp8lMY6uXLc4DMMmaQ_1784044763
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F02AE180059A;
	Tue, 14 Jul 2026 15:59:22 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.50])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DC426195608C;
	Tue, 14 Jul 2026 15:59:18 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 2/2] wifi: ath12k: implement custom wake_tx_queue with flow control
Date: Tue, 14 Jul 2026 17:59:16 +0200
Message-ID: <20260714155916.663864-1-jtornosm@redhat.com>
In-Reply-To: <2b5dfc9a-d2fc-4396-a004-4d3dbe30b408@oss.qualcomm.com>
References: <2b5dfc9a-d2fc-4396-a004-4d3dbe30b408@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 5sQorBF7viZZLCOgp61-Z45InjoCGnlmglB_hsW5kpM_1784044763
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_165932_808558_6C1C1359 
X-CRM114-Status: UNSURE (   4.92  )
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

Hi Jeff

Thank you for your feedback and for routing to the team.
I will try to ensure the approach fits all the ath12k datapath requirements.


Best regards,
Jose Ignacio


