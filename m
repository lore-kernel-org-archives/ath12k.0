Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAC360A383D
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 06:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pXLCDvm5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lvsAkO5M;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LxRp97PS;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LxRp97PS;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LxRp97PS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hJTbezORZnYJia58M/w7jTBC+CsV7fk7tMYV5VsvrrY=; b=pXLCDvm5HUSNVct33U3JeHyU90
	R07kuizvS4nQeCI/kAmKYJFWBfVyphkvwiAlzlJugQqw9V5eZIMBDUJ+Pp3N8FVjto/DLumQM+HVj
	8KTm8jepB6hxbNC8EWw07iaQvJTiKOKMBzynLBDHrAMtKZpBReL3TkWbt1XZfQbfG3/ep/NlEUCsI
	RSZO4Gi65/2paBYWid45lSed66ZmzJfkZ/GJSiivItwzom2pn5yenBhT8ubUPeliTX0VII37M+A5f
	H/4dlm3v5/MsPVNz/xqd2DJJXvE2dBF3esaa0Mp+RLf7goQZz4bog7X8jZTX+Rj+/4Nc19M19pI5K
	4Vx1rLBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPUK-0000000B8KD-2frZ;
	Wed, 21 Oct 2026 06:07:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPUI-0000000B8Ij-47Pb
	for ath12k@bombadil.infradead.org;
	Wed, 21 Oct 2026 06:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=hJTbezORZnYJia58M/w7jTBC+CsV7fk7tMYV5VsvrrY=; b=lvsAkO5MOun4TH3kuPpDx82l49
	RXsY/HhlMucrIO/R82MvYE6+LODq5JjUxv0EngWUPac3r49C3cAewwN/evAwGyH2rXuK/yyFFOuBq
	iUk0add+FgsaaC0OHvIUqJeK+YKUZ7PLhBa5JD++I63qNviL4yfJl1L+qNGn/waZdq1XcTBnjVEWX
	RNMNZDsq4qEFVaDSJ+jxKT03zuf7VuujWr7HlY4Xoffy4wDNd3Oy/IcO0w1DWFMk3Ib8IyxrfvPg3
	WhcC7Bf9tWUFfPNOhaI7xf1JSatb7CR8x2/No0WiyHQFsFDNhdo7+GhHOA6awsDKxiwoyzqmGbcEL
	M1Ab+VdQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJPUF-00000005Uci-0OGf
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 06:07:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hJTbezORZnYJia58M/w7jTBC+CsV7fk7tMYV5VsvrrY=;
	b=LxRp97PSxwp8yWOTzE5MsIbqwH5171RiCcjKv+PsMPaD2UQrkd+HkhdHs+PQVpLWyxi659
	jBOzzilb5Rtgy/9iMIdaUxMhC9Bq/vVjdOKn4FxRVLAJmMpUDqiATXvRZIT3J7fDCP0eWY
	S/Er7yGp6wOe2gOb2y7KV4Q+h9NPTQo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hJTbezORZnYJia58M/w7jTBC+CsV7fk7tMYV5VsvrrY=;
	b=LxRp97PSxwp8yWOTzE5MsIbqwH5171RiCcjKv+PsMPaD2UQrkd+HkhdHs+PQVpLWyxi659
	jBOzzilb5Rtgy/9iMIdaUxMhC9Bq/vVjdOKn4FxRVLAJmMpUDqiATXvRZIT3J7fDCP0eWY
	S/Er7yGp6wOe2gOb2y7KV4Q+h9NPTQo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hJTbezORZnYJia58M/w7jTBC+CsV7fk7tMYV5VsvrrY=;
	b=LxRp97PSxwp8yWOTzE5MsIbqwH5171RiCcjKv+PsMPaD2UQrkd+HkhdHs+PQVpLWyxi659
	jBOzzilb5Rtgy/9iMIdaUxMhC9Bq/vVjdOKn4FxRVLAJmMpUDqiATXvRZIT3J7fDCP0eWY
	S/Er7yGp6wOe2gOb2y7KV4Q+h9NPTQo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-LhCrz1F7PyyeUPBsoPOzHg-1; Wed,
 21 Oct 2026 06:07:35 +0000
X-MC-Unique: LhCrz1F7PyyeUPBsoPOzHg-1
X-Mimecast-MFC-AGG-ID: LhCrz1F7PyyeUPBsoPOzHg_1792562854
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 174E9180028B;
	Wed, 21 Oct 2026 06:07:33 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9266630001A2;
	Wed, 21 Oct 2026 06:07:29 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: tamizh.raja@oss.qualcomm.com,
	julius@bairaktaris.de,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v8 0/3] wifi: ath11k: implement TX flow control
Date: Wed, 21 Oct 2026 08:07:22 +0200
Message-ID: <20261021060725.242681-1-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 6eRjsONkB6aNo2_3VRvNHeVSqPgCDOD6VBxFwm3zsKg_1792562854
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_070743_561802_25D18087 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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

This series implements a custom wake_tx_queue operation for the ath11k
driver to prevent hardware ring overflow issues under heavy traffic.

Without proper flow control, the driver experiences -ENOMEM errors
("failed to transmit frame -12") when the hardware TCL ring fills up.
These issues are more commonly observed in VMs with PCIe passthrough but
also occur on bare metal systems.

The implementation follows the pattern used in the iwlwifi driver,
adapted for ath11k hardware ring architecture, checking hardware ring
space before dequeuing packets from mac80211.

Testing shows stable operation with eliminated -ENOMEM errors and
improved throughput under heavy traffic conditions.

Jose Ignacio Tornos Martinez (3):
  wifi: ath11k: use queue mapping for WCN6750 ring selection
  wifi: ath11k: remove skb parameter from get_ring_selector
  wifi: ath11k: implement custom wake_tx_queue with flow control

v8: Split ath11k and ath12k into separate series to avoid conflict
    with Julius's airtime queue limits series (ath11k only) and help to
    unblock both
    No code changes from v7
v7: https://lore.kernel.org/all/20260917064825.12747-1-jtornosm@redhat.com/
--
2.54.0


