Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656401088E65
	for <ath12k@archiver.kernel.org>; Thu, 19 Mar 2026 03:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJtrE0QaoN7ncD+Y1nbvcSE0oQoNr4XLNfo23aiMjk0=; b=fqLTins/6p3Vytrn8QYCSeNYAw
	54iGQjh1F1+uoDMYyXuFw9KLppyzTpZJJfhYtxDSk3g5/DL+HEnf9lu6Pw7B402JxtEO4mgZLCBdG
	YtgfWs3bt2yGK9eh8isvfB9Nfb/3YZsfRyiIkOqTQ/qQj65pM08AXW4pR8ZJtDDPiuXSlj5lSj9cp
	2Z48P2lQpvrphPz3nGsPuhiUGNaTeIsac3vzYEdCfmSbondtiQ/96RRv6a3d29zLWeanJtXW3YrO+
	IvavBHuhgqHvONNkPtjXK6U/aHYNqUMtBlw4fydWA/euWFKFLgz9hTbB4oDd3VW6E4ofP+dQflkSj
	7Zolx4fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w33d7-00000009n2w-0FFt;
	Thu, 19 Mar 2026 03:01:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w33d5-00000009n29-17AT
	for ath12k@bombadil.infradead.org;
	Thu, 19 Mar 2026 03:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SJtrE0QaoN7ncD+Y1nbvcSE0oQoNr4XLNfo23aiMjk0=; b=hp0DF8SZBgYTRmpcLcqtTROrzb
	h2lG8tdQoz5p4BeTFIjj0TYcvAwlRfWBtDr/R5v2ntHB5Q2meHCQUJxMZMA56fFuAxUNRT1qsEfHx
	HyT3xTFWLP1wY2hrbMMtTpZFM/veor+1KPPxHz6LqQ5pK1+JhcBHfJ/DkM7kStpF6mQsUdcm1EI5g
	LO7alrm3UBKKKU3RhUeOAxOYYXcg28+rT4Gi7wGxT6xXUz5Y+X1+VUrH+3DJDNqobngycPzWroQwr
	e1B69f1ZejuXkktcBBY/xztKXhdB4L9eIEDxAF1jDk11V7ASyY9CECtHFvI8MXV4GDEx1mAfMDy33
	rBCbkBgQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w33cn-0000000Cc2X-0dKJ
	for ath12k@lists.infradead.org;
	Thu, 19 Mar 2026 03:00:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J0J18Z3770262
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 03:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SJtrE0QaoN7ncD+Y1nbvcSE0oQoNr4XLNfo23aiMjk0=; b=nZ0v0NAVyDwmcsm9
	C9+XbRCQ90c4OsAoJitgplAMg3pTQuyQxeu4Hnq9Ny6gF1bxSPGF5Qbqq9Cx1brk
	VqFTeOp5lXxE83zmVUeAbhvpDncD9IpLjZrA6PNVaxz3EkxfgOYlYDtMMzv0mND7
	/9OTS/3AKf8fSoce2TQeFUd1dff2e8gZDO9T4B4kIbENfCpOOml13IjEBwk2PdKG
	I1GHKleKwdb2z1guLm2o3OL0X39JOj7i2q0EyxgkjkjkbkwIKkQi3PqUhI4GGqaq
	4RGT+9qx5lAjzgL87FB2uuOQNQFekfcajsinD4MXdj9rP9EbKzfcqAwHWWzxC6Vj
	MyfcYw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyqcduyn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 03:00:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b059ab124dso7734035ad.1
        for <ath12k@lists.infradead.org>; Wed, 18 Mar 2026 20:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773889230; x=1774494030; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SJtrE0QaoN7ncD+Y1nbvcSE0oQoNr4XLNfo23aiMjk0=;
        b=C8SrQJnnRc+DexTw8qatnNr5qu6xVGfGUTnkQVYC/rIY6z2zLYzzaKtr3TOmVxbD09
         8x4XJbub8xa+84ufxLSBUxEWiNMkoS+PdJgPvwUKiDdY0B/kEttsGYme3+t1iFKJP/Qe
         1EBVpQ2b3QXQzhZas9T53y0QjkvGMr0Ziy3Fq6g2CdOv8pp9dzhnKgh6e5AFOz7g9RJL
         qLjO4KSgB7sYR26cbjgk/Ca6AzmB/Vd8TBbsNxQyn3dcD4ZOK0sAWIYkn0xqXZHcQ8AH
         TMkDnT+gXd4Z5P2x3YN3mMQ55U0B/ISFVrIMjZtg9TeYA2EAhwrHAMw6S5Xq+pn4gny+
         Qf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773889230; x=1774494030;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJtrE0QaoN7ncD+Y1nbvcSE0oQoNr4XLNfo23aiMjk0=;
        b=eKfQyYmjUEHOkYDbhd7gwTvCSpLkKJC0PdlefG9DaZb/cVXQ5ZLmLZOCVoMVJY6U7h
         tTN5f37BrM5jJKLb6ZDOXyO9fPU4ICVDKZ3l/ctWFGg/DZYlUWoB8vjzkTYTKoadXUMt
         deCMjTuY3J65BdMrmTZdf6NDPhO7OBPU3NUzKPambHy5plDgDJnetdxm6G/dBPXmOOhi
         NL8ZXWlAgVCEbM4uY6G/SStmNBJF7mmBf4Y9mpIeYWfrzf60amAUxu7R8D5LT1LQgXX7
         AkhrrVbHWo63E/Dj78zMAH2ijGlB6lRvG/oe815pTRcqc3jQfSJI3Q0Sa2uWSnua4Y4u
         EIGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUnZAy7CH+kSIZUTvZlMKkEG2B6xMcsRTAWM7efBA43VwR6xrbUyMHCq/bsf5z0BT1hgqg1uQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ3rxo7piled6f0y+TzHBFy5nFkB2AqlkFWxeZc2UQEGo56QQy
	DgNaJXWAuymNIt6iRdzLsKqpB0/3pyOnnl+RKGp/i8cg+4wIOaaYJUydgu73omCVqZXfjG8Zvl7
	MsUcO1TS5h9/tw3X/5ej6n2zBplAZwZNzZ79GEtSF4q3ZtV0IxbDjc469rwPognHhnJLHBrMjVq
	8=
X-Gm-Gg: ATEYQzw4Rh1YmhtiiFxxcjO++OtVCioSMb9DjzdvGQ8PUInuYBgrO9l2sNdrRlOan7m
	RCRODlHCzmuETGT0V4yk3oJTmq8ZuzApGVtrRdTerz7RjsEbqzBM8cmCDy+BwOfaHpAfkprezXd
	BmcrqIT/tykwa30QeL4aYcfwr7VryCWaPxhE4ZMQJXrHrTsx83kEElmpaE+bIwuuDZltyGDfZvN
	JFr74Q2vhdaczQLF8fr4UoUrrXfjun9QqPH+uCy1hXskDXv5BL8wB8kTJdSIPFy+o5QM+So0cCO
	1jZ1FpakSECgFQDO31BgHHQ841xrIdofpmVx1Y7ufPXbp3raLzxAvVOmVp6/tXH7jmM7MhPmRZ5
	3iBo2QakRVgHP3OB679xJ5vS8ueaT8YSTlczoQeayDrphhtTF92muNl7BG9JKqG42zyH/Aby11j
	Dsa4kA1EqR/kmt6914bbk=
X-Received: by 2002:a17:903:37c6:b0:2ae:7f28:124b with SMTP id d9443c01a7336-2b06e3554d7mr64196065ad.22.1773889229694;
        Wed, 18 Mar 2026 20:00:29 -0700 (PDT)
X-Received: by 2002:a17:903:37c6:b0:2ae:7f28:124b with SMTP id d9443c01a7336-2b06e3554d7mr64195545ad.22.1773889229010;
        Wed, 18 Mar 2026 20:00:29 -0700 (PDT)
Received: from [10.133.33.235] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e627132sm43286915ad.74.2026.03.18.20.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 20:00:27 -0700 (PDT)
Message-ID: <44549364-7187-4b1a-b1fe-5bf6e309ec16@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 11:00:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix MAC address copy on big endian
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260317-fix-mac-addr-copy-on-big-endian-v1-1-b7b6c49cb07f@westermo.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260317-fix-mac-addr-copy-on-big-endian-v1-1-b7b6c49cb07f@westermo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAyMSBTYWx0ZWRfXwd8ib1SonyUD
 rdAOs3G/tspiBx+znVHoYWZVm9OsPMGRe8TiZoyGIrwwBdR5+OR1rWaJSCVFTbTswV0+X1NWnxQ
 g1foAUpbDAF3vUybiF3zEI9NWt8WbWd/WEjp784tQweXWtZ/mxvPrwGqidrcsKdquZWGy00xVwe
 k9Ymdj5q5fEXaUKj9HKRnyiIRpkdI39buzieFYi+5fXmGtaCAldzbtzfOtT7JoUrOdB7xsMfjGr
 2iYRxzzHpZHX2IGOiSgpdTynbeP58SDcgT58Xk5ujjtLuhunWj7U8hnOZO6D59AB4o7gqT7H5dN
 sF8j3Rf+OnQ+2SYupv78/nBkE7hCicsNu49YUJwJU4CQi6MbyNbaC/TApMbfbhxH0M/OPCnyKz/
 FErENiMzDtcMwPVlfmrI/OIbLXB0pwjbcPlPR0o19qLbg9bZzEg6PCl3ZqlP2B44OIhTDYAnGfy
 sG5t//JrZaJhwciHm/g==
X-Proofpoint-ORIG-GUID: qx7IB3-38kj8XZoxRO7S_ypzsyU5aQdH
X-Authority-Analysis: v=2.4 cv=H87WAuYi c=1 sm=1 tr=0 ts=69bb66ce cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=N9GNhs4bAAAA:8 a=ywX3x0iTvHv4trEmZJsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: qx7IB3-38kj8XZoxRO7S_ypzsyU5aQdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_030047_867342_61F12960 
X-CRM114-Status: GOOD (  16.95  )
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



On 3/17/2026 7:22 PM, Alexander Wilhelm wrote:
> The ath12k_dp_get_mac_addr function performs a simple memcpy from a
> CPU-native data types into an u8 array. On a big-endian architecture, this
> later results in a null‑pointer dereference. Convert the data to

curious how could this happen? how matter the endian, it is just six bytes which are not a
pointer hence can not be dereferenced, no?

> little‑endian first, then copy it into the target array.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index f8cfc7bb29dd..50957915dbf4 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -647,8 +647,11 @@ int ath12k_dp_arch_rx_tid_delete_handler(struct ath12k_dp *dp,
>  
>  static inline void ath12k_dp_get_mac_addr(u32 addr_l32, u16 addr_h16, u8 *addr)
>  {
> -	memcpy(addr, &addr_l32, 4);
> -	memcpy(addr + 4, &addr_h16, ETH_ALEN - 4);
> +	__le32 le_addr_l32 = cpu_to_le32(addr_l32);
> +	__le16 le_addr_h16 = cpu_to_le16(addr_h16);
> +
> +	memcpy(addr, &le_addr_l32, 4);
> +	memcpy(addr + 4, &le_addr_h16, ETH_ALEN - 4);
>  }
>  
>  static inline struct ath12k_dp *
> 
> ---
> base-commit: 702847e8cfd51856836a282db2073defd7cfd80c
> change-id: 20260317-fix-mac-addr-copy-on-big-endian-f1a4fea40184
> 
> Best regards,


