Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12315C3ABDD
	for <ath12k@archiver.kernel.org>; Tue, 20 May 2025 16:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWkE6wrfAiys8X9HQrhID/AOg4udR5WQhCtdwknEz8w=; b=KgH2aT/vfx6AdAeRKlo2X6f7SM
	Hs+gstMMuC4c1XlNFnmRdo4veFpP3nTW1RlAVHGd1PylfMC/X034eViZ9sL2NCVmGjOYqQmOZ6IPT
	ARtJfwoO94eg35gVkuJbKJ3U6GSGJY3SiLgCFBwgRAgTsmcbDs52wakcoFVuOCsJJK/RCIEMINJgl
	jD+2+cApmRbCdS41j/Gc+wrNCD8B1a871d98C5IgcVVkWBAwClWCUTz+qLI3msFB5xTr9aY8b7AOG
	pEeCt7zYNvsVsrXPab4W0RTBrGg4K9KU0bdzw5yt7QJ5pL1Z/C6qMV5qXOVDgkyzhFy9TC9wRicRa
	30RWNJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQ3q-0000000DZkc-3MkJ;
	Tue, 20 May 2025 16:43:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPow-0000000DXY5-0ger
	for ath12k@lists.infradead.org;
	Tue, 20 May 2025 16:28:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KFKxRq002426
	for <ath12k@lists.infradead.org>; Tue, 20 May 2025 16:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oWkE6wrfAiys8X9HQrhID/AOg4udR5WQhCtdwknEz8w=; b=RqROJ4ADMDc/egCr
	IWrOEx5RYW4X9XZum8bGzVp0XFdWIMAJrqrEhS4wuCS7wtiV+Ywu9ORD77wPNHjw
	WctM/m+clvQJmLdVjQh715QeiSltWIY22qxmn6WnVNYBD07f2Y1f8qMiqWxGCb/X
	neT9mT+6b27O9fBydUwz8KffzOfNc4lpdDmUD9fdQYwYvy7cJ0fpUs6z/nzg0mlQ
	jJ/L2Aq+rPO72/0Wye5YWvjU+XtEWDFVBT0PL78mrYOcf3KBNo8ky4+H13RbNI2x
	2lxz55GxzLNFkngYlsex/CXMFfHuDBXsYm3mhLZAVWfj6D/x7JZGzjWyZ1RBMk1R
	jJj7Ow==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atmndv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 20 May 2025 16:28:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b00e4358a34so3497878a12.0
        for <ath12k@lists.infradead.org>; Tue, 20 May 2025 09:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747758480; x=1748363280;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oWkE6wrfAiys8X9HQrhID/AOg4udR5WQhCtdwknEz8w=;
        b=CuVGdiZEQC51I/GBi0shTzTQKeKuV62MptcFioUWEtyr9k7bm02fiqyoogSvTlpvqI
         ajoaqsPVKU4tbkMp7eoRElieDfOUrZHUkRHPAgmEw3rEYZl1qfazJPqpWelG0ICIAokb
         CaYlTaQODcVit8t1x2eakOmuTBl89WYV/gbxchrYUssH6u0/P6t+1Rr+4PdL+S0xuxOb
         i6dWGx4ZzKlxb8fo4MqZ4kJIpVTEyP0sK2dY65BoohG4hAdakpqE7NIQLijLDoBp96+v
         sAHLBakA6DFdBhrazHArfrcVnsGuotRQZJxUlI00T9DSdZFsF9hKqdt847EWVgickZ/R
         kN7w==
X-Forwarded-Encrypted: i=1; AJvYcCU/clhUajiuqwoTFSDV2FrMvEgGf8+dU9sMcGHoxv0u1vBTx9dUDZxs4afLj3a6U8NJp26HeSQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy09DgEidxg3bWxq7Ukp4kmuSE35MfKwOht/qld4+8TiR5l1UYt
	gHeU2Th0mREjjh5NIYW2r5u1wNHeUr+zcqqg7SsnG7b6OgX7LBxc3HkL2J3+mvcG3HElx2twavG
	G1ng29ussuKkuCGjoUmEP2z/AtryYaIeHh/RjcxLBIItxseaGsy8tab+g9sENpad8
X-Gm-Gg: ASbGnctWu3Rwk3zrfv5sHpGGNgJAEfsIyYZwMg3b632dxxF7B1K76jdrOYOMZJ1T7sU
	AywylBOIpxkhdYbQuy1LYaP0FXcCjPpX3KgH0CnVCo73iT+C5S+FQ4eGLkz/gRk0lY4SxgI0mUt
	ApLVA5tU6kl8P2PHoHLD3pPRDfEL78Kf8PpVq+8IVlegf6zhXh+qgzDtbfFrHryYdbDr+CVxUpK
	2Zq4I9xwytrSvEZPCTgwMSRWPWjT91TpTEB4T/TU/GVR7VDlqYIM8+84BaowDlkCHiqZkIRLZo/
	YwtbIJXceAU2RjPrZmGo3eGXI+YJM7RzPq1FNNCiRzBxFVNnHLvT7UBh0ycEJqvxxiE=
X-Received: by 2002:a17:903:22c8:b0:233:b397:1a38 with SMTP id d9443c01a7336-233b3971a69mr1035255ad.2.1747758479748;
        Tue, 20 May 2025 09:27:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5eCXMwctL6VYRhnYTfMJUpfPRTT3rczhB1NUrHqOcjFwE3PZOtwEroBxliG5kQjGn1ipa4A==
X-Received: by 2002:a17:903:22c8:b0:233:b397:1a38 with SMTP id d9443c01a7336-233b3971a69mr1034885ad.2.1747758479312;
        Tue, 20 May 2025 09:27:59 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-233abb99a06sm3393195ad.254.2025.05.20.09.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:27:59 -0700 (PDT)
Message-ID: <748f0908-75e8-4712-86ad-220174c1672a@oss.qualcomm.com>
Date: Tue, 20 May 2025 09:27:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 5/5] wifi: ath12k: Enable IPQ5424 WiFi device
 support
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
References: <20250518-ath12k-ipq5424-v2-0-ef81b833dc97@quicinc.com>
 <20250518-ath12k-ipq5424-v2-5-ef81b833dc97@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250518-ath12k-ipq5424-v2-5-ef81b833dc97@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682cad91 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=b1i3P6Qac5NO7_78IJgA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: eGGj6kD-ot4xGTnXmK3SW7L4ynOFrkl1
X-Proofpoint-GUID: eGGj6kD-ot4xGTnXmK3SW7L4ynOFrkl1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzNSBTYWx0ZWRfXxV/exd+ihW0/
 JE0RlMJCdYe/VwMO3AAaLBQdlpvrpO7MSx5lVfFnIStyYUNWu8FG2JUIIc1/tYFPD36TcWoG4vj
 5q60uOdCrHetzPQWyMtpNvTHG3CYQV0pBMcDMzXAYF6FWGbIzDdsdTxZrKRzzK217V9tZz3eXW3
 EdSN4DXNq/VCV2pzP789v9oYK5siYFuhOroMO06G1q7OqhSy8rbOzBvPioBXM8V9X0g/7EJEhZY
 hLQnvZGaYRuEDyTWAsn54ZfmJX4tFES/nPmrzr2ynopm1gx08sHUsNEB1kpEC80dBbPqfwsXT59
 V1X6skUloucPrmlQ6Gm/ugf45vneMoVBReI83KXCs5cOklZx68FiaNSCPEw1rDHtQz2LfUp0nF9
 VXYkcQaOFd6l/GMyMXjQ9HgOxcNL4k5kbg0MfpQ0rl658O1oxlXGj1gZxOFDMxebw41DxZEB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_092802_334209_F14FD756 
X-CRM114-Status: GOOD (  11.15  )
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

On 5/18/2025 11:22 AM, Raj Kumar Bhagat wrote:
> @@ -1008,24 +1011,19 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
>  	if (!ab)
>  		return -ENOMEM;
>  
> -	hw_rev = (enum ath12k_hw_rev)(kernel_ulong_t)of_device_get_match_data(&pdev->dev);
> -	switch (hw_rev) {
> -	case ATH12K_HW_IPQ5332_HW10:
> -		hif_ops = &ath12k_ahb_hif_ops_ipq5332;
> -		userpd_id = ATH12K_IPQ5332_USERPD_ID;
> -		break;
> -	default:
> +	ab_ahb = ath12k_ab_to_ahb(ab);
> +	ab_ahb->ab = ab;
> +	ab_ahb->ahb_data =
> +		(struct ath12k_ahb_probe_data *)of_device_get_match_data(&pdev->dev);

seems like an unnecessary (and incorrect?) typecast
ahb_data is const struct ath12k_ahb_probe_data *
of_device_get_match_data() returns const void *
so the const void * => const struct ath12k_ahb_probe_data *
promotion should happen automatically, without typecasting away the const
qualifier


