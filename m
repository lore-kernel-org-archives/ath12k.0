Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC46D3C52C
	for <ath12k@archiver.kernel.org>; Thu, 17 Oct 2024 19:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEMwPbPjhOeCuGpW7CvJjh71+cV/9jSkHyqh/UfS9SM=; b=Syw78AJsipfQHlVqcUJrnid0R6
	yxoYyIqddZm5lGCxrT1W9mwCwMhWslF2tM4MjV+A3zU3jeQz6E1gVHb5OJ+Lp0pHZHaCvlXaqyumM
	8EmZVzZhV5pwdG71iZd2IV6z80wppH5QCLZjG1XKQOG2syHlmnEwawo1uWuSa3J9F02KGN85VUpN0
	F31eS21UsD4W2P+k3DDDrDl6a00CihClLeZhOlGINIQGmsqIyTikljTatvzPN2pXqM/5j8QgNC/Yc
	AgI6AjKtaSFG50CAw7VkyZBns+1CUxNJepthXnfQf8Vd4Ezy33ziAgXxqnnFdGiks7Kx2X4Ft0AtI
	zWkD+Abg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Vyh-0000000G0ap-1nXu
	for ath12k@archiver.kernel.org;
	Thu, 17 Oct 2024 19:16:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Ury-0000000Fodg-2UFj
	for ath12k@lists.infradead.org;
	Thu, 17 Oct 2024 18:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729188304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UEMwPbPjhOeCuGpW7CvJjh71+cV/9jSkHyqh/UfS9SM=;
	b=WoqKbrZvt228LIyL8hYO1NmrlJTvHbDOHWeS2upMRSlpelCEPBdVuFhEnHEHN0iHx3a+Rj
	FMA10foOnzMUn9rqBRaOXCOCwWuvesUjs/oXjDuk1uf3ZBK3I7PWPJe+1BnIYmRgm+0WDR
	RL1cow4uOZGE9kQ2OLZG4tI6uqDvvVU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-649-nLPF2UYVOHu9s-shOmjP-g-1; Thu,
 17 Oct 2024 14:05:02 -0400
X-MC-Unique: nLPF2UYVOHu9s-shOmjP-g-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8332319560A2;
	Thu, 17 Oct 2024 18:05:01 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.106])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7385F300018D;
	Thu, 17 Oct 2024 18:04:58 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: quic_jjohnson@quicinc.com
Cc: ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v3 1/2] wifi: ath12k: fix crash when unbinding
Date: Thu, 17 Oct 2024 20:04:52 +0200
Message-ID: <20241017180456.199393-1-jtornosm@redhat.com>
In-Reply-To: <f9013f01-a61b-4697-a85a-60d70b6596db@quicinc.com>
References: <f9013f01-a61b-4697-a85a-60d70b6596db@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_110506_754960_7E6CE178 
X-CRM114-Status: UNSURE (   9.28  )
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

> Your v3 patches look ok to me, however they are not showing up in Patchwork so
> I cannot act upon them. I suspect the issue is that you did not link them
> together (the 2/2 patch should References: the 1/2 patch). Better would have
> been to maintain a cover letter and have both the 1/1 and 1/2 patch reference
> that, just like you did in the "v1":
> https://msgid.link/20241010175102.207324-1-jtornosm@redhat.com
>
> Can you submit a v4 that follows that original pattern?
Sure, I will do as you say.

Thanks

Best regards
José Ignacio


