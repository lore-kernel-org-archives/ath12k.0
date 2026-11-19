Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F5760A2608
	for <ath12k@archiver.kernel.org>; Thu, 19 Nov 2026 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kb6/dnYY;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EQR5k/S5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=; b=Kb6/dnYYJb0GRv
	7gO9RRdChs+NuxiVHiPQnKH1zJxwpdLcv33uHvvORLYyUDZmxyNlfnhGYu369kQpTWHkL6My0J/So
	3TFTeLtjpHeuG1DVXihlue6FNx7+9d3nKMwDRWvnj3Pk53Z4AYJcrH2M8flnCJoVzpxU2mmZ5CpL8
	DJt3eOj2pRmjvJOjmDfdoZ1/axGu0Am03qDpx6FMS81DDgClpviaZ2SRR4f/6UpQ1wPIZGYO7VBA3
	YX232fqhjrKGIjVPxshuBDzF3gWsrZgXa16qso06BcKNz4KzqToO3UrWf78yJzP8wpN0Tbbl4kHNR
	6KcniZ6i+ICFasSiyLZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyYY-0000000BPeF-0HT2;
	Thu, 19 Nov 2026 09:35:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyYT-0000000BPaR-1huv
	for ath12k@lists.infradead.org;
	Thu, 19 Nov 2026 09:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795080943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=;
	b=EQR5k/S5gX9O2isyt9+JvCb312lvuQU3o+Tqp4+vCflfecSErAFIy3ykBo3xSvgGk7dPsT
	WtLZujzuVFLpnfLmbSdniorq0OACjUOdcLIFEz/ECXMSvzNp4wZQd8wSw/fRHMsunSPAJf
	JibFbSVVIP21JAtWnem5KUV1Mh1omDw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-_ac1QSgaOPSKBBIRqnDr7Q-1; Thu, 19 Nov 2026 04:35:42 -0500
X-MC-Unique: _ac1QSgaOPSKBBIRqnDr7Q-1
X-Mimecast-MFC-AGG-ID: _ac1QSgaOPSKBBIRqnDr7Q_1795080940
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-490d2ac331bso1916087f8f.0
        for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 01:35:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080940; x=1795685740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=;
        b=rAgwXfGkYFcmDTYGrIqojdmOOxmZ6O2vwVpG2XOjnzRTfjnC7YyLJJ8EGTwa5RHuas
         bD5IyJhSdNNYAZKkroCd88I+LV0HYU15jYbBv0iHNNVsBddi+/OyDfp6rOj9GpAvPW22
         hV2Hq9TbwWo9EQNoTKf0WpDGkVL+R0tURvcVPuCR0Bp3B/drDBWmPQC0qjKup49p/s3h
         8y7gLs8s5Ue6GBkBCytcsifFTvqCGGUAc8mEChfY9KNY38DX2dzp8Btl7n+QafNi0T4B
         71+jJDwAyV32Z0VtKRRKlTuqtRKcNnFTlPlrj8ybcsociAFHLQws/KDZfybN0rne1Nl8
         4Igg==
X-Forwarded-Encrypted: i=1; AL+hErF+iQaT/7gwRHj5xXG/61AAHiWEf0luKqQoWP/dfC5NICi1t8RPNwXeKV1TFqmC8Jvg6c5Xhmk=@lists.infradead.org
X-Gm-Message-State: APuU4Z8zFWA1AERbBxwWo1wkEAt8RXo95/2n8QEgInP+ZKdwN0bcl709
	8Fyi1jFrGPbNrMZRDUr3tmSjfWr/HQm0WxXxiPY7UHGh3BIZdrmZmEm4Sf6g/ec+5w/yZtdcd99
	G+zvXEglfnDWoxG7mDWY1Rs8MwbQPGiIkJo57kzrFYvbQ3fVacazq60992+WMYnE=
X-Gm-Gg: AZFdTZeYH7n0shytgV0Pk7U8l37nGm5RRUGIc4bzrsqoAu85PZEhmjeH1zSktXI9BXH
	NrwdPNx+S/1/k5LHirQ9VEQYRgMpWRkLsty3hg4v3BiJ4PF4Q8HOq44t1o+e+rz1XNbDtjurwWu
	jwLhVgo8KCSPN6QSDs7hRQege1ZYP9aFtPk6PICCWA2YAb+x1rGXOV19+fppMC6a1dZiMxrs+pv
	ANH5B8bPBfwkSDrqthxUQ6F2LXKay1T4sNdyKaSpVpU+C2cEbnR+zF77MKl4Xb50vnPhgTCiFjJ
	wHkSlVP8rv/BCGJEK7emUOE8SEFn7btx104/7vdMxVF2Zj/jAtSn6HyeE87AFgEgTEvK9VL8eQr
	/QTK6MUvBgpC5tgeZIkPtcUd9QkJaXVEPXy+3NRyAHAhZ6iH+qY/g0uBoYq2KtbAf+cyyF0vyxf
	hEkIZ+hpI1vHR7vB6WpnoJIibg3DguNA1Y39TuWm9ai2/Y
X-Received: by 2002:a05:6000:184b:b0:48f:bcdf:6f7d with SMTP id ffacd0b85a97d-4a63b6fbd88mr11817886f8f.34.1795080939833;
        Thu, 19 Nov 2026 01:35:39 -0800 (PST)
X-Received: by 2002:a05:6000:184b:b0:48f:bcdf:6f7d with SMTP id ffacd0b85a97d-4a63b6fbd88mr11817756f8f.34.1795080939199;
        Thu, 19 Nov 2026 01:35:39 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c39bsm9495655f8f.17.2026.11.19.01.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:35:38 -0800 (PST)
Message-ID: <4eea6d32-4200-4cd1-860a-70e81356678e@redhat.com>
Date: Thu, 19 Nov 2026 10:35:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 1/4] net: qrtr: Allow the host QRTR to assign
 a unique node id
To: netdev-bot+sashiko@kernel.org, manivannan.sadhasivam@oss.qualcomm.com
Cc: mani@kernel.org, davem@davemloft.net, kuba@kernel.org, horms@kernel.org,
 jjohnson@kernel.org, edumazet@kernel.org, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, andersson@kernel.org,
 christopher.lew@oss.qualcomm.com, deepak.singh@oss.qualcomm.com,
 raj.bhagat@oss.qualcomm.com, juha-matti.tilli@iki.fi,
 jeff.hugo@oss.qualcomm.com, daizhuang.bai@oss.qualcomm.com,
 jeff.johnson@oss.qualcomm.com
References: <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
 <179478985187.3136.15328141866524028119@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179478985187.3136.15328141866524028119@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r7VkJF7Fotl5tkyJniQX8DhLIdGCFEw3Jilr57ZOIrs_1795080940
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_013545_606839_FC4B1BB5 
X-CRM114-Status: GOOD (  10.73  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/16/26 01:44, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 3
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] A failed node-id insert now drops the packet, where the old
>    code still delivered it, and a dropped HELLO is never recovered.
> - [Medium] In AUTO mode, nid and ep_nid can end up different, which the
>    commit message says cannot happen, and the rewrite logic then…

The first concern above looks relevant, and the 2nd deserves at least an
explicit answer.

In general you need to address (either debate or fix) every AI comment with
prio >= Mid.

Next patch as more of such comments.

/P


