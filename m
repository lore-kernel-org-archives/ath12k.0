Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF14CA5FA1
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 09:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Y/oFOa1oxhQ1GdKVJmuNjJ216LwSgeUy79De2Uv5lM=; b=Nt1fkuoc7oyQXmcNdCtcEuf/MI
	egVbdz/DlxWwfck652xjqkwATsvOgZbltDpQ4oIVkgUgMOxTqk2R4vda5kO7plJ16oKLmlBkG33GN
	XZyUAnckE14UOjaS3vkmZ4mwzewE89YEgXZH+G1YXvx7MC8jfgtsM7dq8zEkUhLNMwXKptB4/j5IC
	o7E006B4+79fLcYAo5Ko7MHQwvHHxwz14fSAGJg32MWt/UFXFpkwv35Ok7Mrsg1ermOgyt1AW0cun
	bQVCa7sjev+y+6em9HUMIEC8wKHylp2cLrs2U95Lk92hrIeyo2mxCLA7b6+He8qd1ePA1E76AmDpv
	fChes7Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTgw-00000002uFS-0yEH;
	Tue, 29 Sep 2026 09:00:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTgs-00000002uEE-2uFD
	for ath12k@lists.infradead.org;
	Tue, 29 Sep 2026 09:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790672397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Y/oFOa1oxhQ1GdKVJmuNjJ216LwSgeUy79De2Uv5lM=;
	b=SNnoIcJplvs72YBB6qqDfYu8JHKeu8O+iOtBrQwE6KVQt7XoTEXqTxk3cOWkyY928QbOt/
	+fHXkXXRWonA/LgXQ60DZRl066QLycBbbZ8MaqqkDpsXXXFqp5NoozPUhTCRMB4QNOCT4n
	9SnuiOESQ7wKcjtpDSoQ7mQrIKsOCg8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-9lg9rKFjPCyV1wSOavCmSA-1; Tue, 29 Sep 2026 04:59:53 -0400
X-MC-Unique: 9lg9rKFjPCyV1wSOavCmSA-1
X-Mimecast-MFC-AGG-ID: 9lg9rKFjPCyV1wSOavCmSA_1790672393
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e6683d48fso42313065e9.0
        for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 01:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672392; x=1791277192;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Y/oFOa1oxhQ1GdKVJmuNjJ216LwSgeUy79De2Uv5lM=;
        b=WgMOJhAQP12fQ5fLxdz4ZSiFCjc2xuU69Fi8gVTpWKNqwSDrtDHPpaOfY0ZxhjgaH6
         LKX3QmIue5pGcjIKiCEuf7b+VMzkp6JcNk9gpTOoHdrLSAsaNWgVHFjMZ3VpMSj9C0SJ
         PCJPS5U3wi9qEbFZxIbFlEEFqdVX6ysrFCdKKTbd/yDU+747qCTVhbD59UjEZQkg2NuK
         VaLafIyHT6HXn5KXCSjTX7MwSdxqrliH86MVrz7vlSsgFGXQAco7mvZ2Xd+rM5xUWbT2
         m6qFgMf5dwgb/K5TAD5BYu6AsmWNHWJey51Nzaj66O+QkkzOOw0CIi8KBMd75e8axnrY
         /B4w==
X-Forwarded-Encrypted: i=1; AKwUvBztsx7FtC/EuocwMFTVE9sdaH33dkZ8agVKozPy3eszdx4CH47FvSSSYzhkvVJKaEKcBuegkjg=@lists.infradead.org
X-Gm-Message-State: AFuF++nzNYKAaXQTqCTQz+zqw2wCgaXjPUGQqwzU3tfL0ixPbMRVCbj4
	t9eXsQAOmFXpCTwY3Az/Jy/EqMUr/qIbxN/6h+K9wwPaMwmH+h1N3O7JDXfF0eTdQo1OLd3hOgF
	uuIoREJgXzJc4rGLkOdXIXU5J3/aETEQ+jB650YPqNAhthcE25GrL11CZJ4kamCo=
X-Gm-Gg: AYBFou1kXHTD6WUv+lxjwjSfE0KFX1d0fLlVBuqvSXPcOCgprqIjjPo+ATTnTI9HaIT
	2VzbN2jRyYl0ut2V9IYxfq8Ca/yTSpAPSb+8++ofBC/vk5601XiaqLAPfy4MoQBtyVxL2I+HLUE
	S8JC2UDiLR2085kcpmVDjubMKdIBEFVoMRBguD2hRob+lAczC6RIW3cyls+zX6lMhy8C9HjEyAx
	hbOZOUYpJs+x8TnL1w6x3B8saRN6DPwP4i8HZPpdV+jd868XxU6dQT4B10mfyoK5cCG/J9jConS
	2IkUnN3s6WbWNJuCON9R+/io3cMjBQ+n/cktO2eoPakGuH71M61TeM8J2M8ENrsu25jE06kZH3H
	wZraAbmemvUSzU9Q/hIuesa3jdDF+MdXypm11piV/mAIgU1Wdk//0TxVvJ3htKMSr1XJq/CHPhg
	==
X-Received: by 2002:a05:600c:8b33:b0:49f:f9fa:fcfe with SMTP id 5b1f17b1804b1-49ff9fafdccmr148517465e9.13.1790672392632;
        Tue, 29 Sep 2026 01:59:52 -0700 (PDT)
X-Received: by 2002:a05:600c:8b33:b0:49f:f9fa:fcfe with SMTP id 5b1f17b1804b1-49ff9fafdccmr148516975e9.13.1790672392160;
        Tue, 29 Sep 2026 01:59:52 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec770sm65459555e9.8.2026.09.29.01.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:59:51 -0700 (PDT)
Message-ID: <4f03112d-e5c5-486b-8317-1ecc1aeb6636@redhat.com>
Date: Tue, 29 Sep 2026 10:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] net: qrtr: Add support for using identical MHI
 endpoint devices
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 Bjorn Andersson <andersson@kernel.org>,
 Chris Lew <christopher.lew@oss.qualcomm.com>,
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
 Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
 Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rTy9oCtQPL00vxHSdHaeGrmQYLwcGB-GNVLwkPlOalg_1790672393
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_015958_814867_F0471DC7 
X-CRM114-Status: GOOD (  16.52  )
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

On 9/22/26 15:41, Manivannan Sadhasivam wrote:
> This series reworks the QRTR driver to add support for using identical MHI
> endpoint devices at the same time. Currently, QRTR driver has a limitation on
> using more than one identical MHI endpoint devices like QCS6490 or any Qcom
> Endpoint device making use of QRTR at the same time. Because of the fact that
> these devices will have the identical QRTR node id, they cannot be used at the
> same time, on the same host machine.
> 
> This limitation is a blocker for running upstream kernel on devices like Qcom
> based routers as they often have multiple identical WLAN Endpoint devices
> connected to the Router SoC.
> 
> This series supersedes the following 2 series from Juha:
> https://lore.kernel.org/all/20260915054207.2513877-1-juha-matti.tilli@iki.fi
> https://lore.kernel.org/all/20260915074135.2567411-1-juha-matti.tilli@iki.fi
> 
> Compared to the series from Juha, this series simplifies the multi-endpoint
> support by computing a unique node id for each MHI endpoint and uses it for the
> internal QRTR book keeping. This ensures that even if the MHI endpoint devices
> have same node ids, the host QRTR will always use a unique node id for each one
> of them.
> 
> More details can be found in the individual patches.
> 
> Testing
> =======
> 
> Juha tested this series on multi ath11k/12k setup by backporting this series to
> 6.6 kernel.
> 
> Merge Strategy
> ==============
> 
> Since both QRTR and ath drivers are falling under the networking tree, the whole
> series can be merged through netdev tree.
IMHO doable, with Johannes/Jeff ack.

Anyhow the clashiko provided feedback looks relevant, please have a look.

Also please note you are supposed to react to such feedback proactively.

/P


