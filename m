Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7597D1AD4E
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 12:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0chUVeWVNXUa+6nJgceHk0TDRpnJb7xfMwzVuSrbvU=; b=LvYdR98SYSu3PCg4RUzBlKvrm9
	L8VJkgQrsXtQ3364IEfknMUqSFsxRGjScpwSnDx2tcgoCuH9iXiJe3eEzRkQCKE0VewNS1pTUTgk2
	gUEyAKXXy77EON23kt7mkrYmX37Yz6/K0GMF/HNfABrtoEpRysOEWC7xVGqvUaSJTsitqfggGdfJT
	9wJWdc/8bgVtMScuwYTX/53SnlaqpC+8/WTjtkh0NfvhduqeJXSM+w+6Pd/PpdcMp6cDhKochjPS/
	D34xDX6SNKsBiDhsJb16Z8IC1uv+l0E00qfISBjRjCd1122ig/p/a9uTBgy9WBfnAX6fmLwfUR6PY
	kyr/oPLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t12j0-0000000BgEP-152A
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 12:01:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t12iv-0000000BgAg-2iGa
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 12:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729080111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L0chUVeWVNXUa+6nJgceHk0TDRpnJb7xfMwzVuSrbvU=;
	b=cpA/7PImqHJ6s2LdeLB3I6FQDhPdS9Bh0XvK4JL49s6/QAQU6iFQTruZNMqf1qONb4/Yk8
	Y80M5UVakY7T9n1S3GX+D8eBn/QrqqrOAMapOVTbu/lH8Mu2ZW62BDqi4aBjx9VTfRb3ZB
	L2ZiVPz06vLb8rPAp5zHvtCvnNQ6fTk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-AtxIvyv1PyiGfnUaJkNNVQ-1; Wed,
 16 Oct 2024 08:01:48 -0400
X-MC-Unique: AtxIvyv1PyiGfnUaJkNNVQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 69E86195609E;
	Wed, 16 Oct 2024 12:01:46 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.76])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 92F9A3000198;
	Wed, 16 Oct 2024 12:01:42 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: quic_jjohnson@quicinc.com
Cc: ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] wifi: ath12k: fix crash when unbinding
Date: Wed, 16 Oct 2024 14:01:38 +0200
Message-ID: <20241016120140.204902-1-jtornosm@redhat.com>
In-Reply-To: <039e7ccb-adb2-4c36-bd5b-83b5965373d7@quicinc.com>
References: <039e7ccb-adb2-4c36-bd5b-83b5965373d7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_050153_853332_F639D8B5 
X-CRM114-Status: UNSURE (   6.74  )
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

> WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")'
> #51: 
> Fixes: d889913205cf7 ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
>
> same comment applies to the 2/2 patch
Ok, I will fix it in a next version of the patches.

Thanks

Best regards
José Ignacio


