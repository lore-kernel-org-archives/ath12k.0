Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507D7C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 02:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LU9MgakiWMszdxz5hUBJe33ypmJuJW5jEJEkTuH/BTs=; b=lUzVBV15Lxqa9FzuEoOzfEmH56
	eDrHow9P5HeXbVAAYBfl9b49D0b4jJTgGWezjPg3lN77C8pNWT6u79KYlcJ9jfQkNUc67U9DfzVUi
	YEHgtq13h96avgqmDbvyl2ot9Uw7Ll+NtBLnkn1lFLLmTAryEg9n1vtZ03c2b8xtyuPPz6O4OZ2SE
	mDuBoQkicAlVr+IVD7FjIwvhzBaLTVJiIhCmN1Npl2hSNcWtqGWx1b7T1mWFG2ULvQ0gAW8wpNC7A
	PvLMKg9YWwJCTnSTasowqkAlAdkfvonIhWAmWngv+RdJCK6+dMq1JZG7lnhZGRTO9+Ggc4nKaOUjt
	oZsXgHiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1Wx-0000000DZZa-07l6;
	Mon, 29 Jun 2026 02:15:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1Wu-0000000DZZ7-32R9
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 02:15:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SNwVHM1177727
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 02:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LU9MgakiWMszdxz5hUBJe33ypmJuJW5jEJEkTuH/BTs=; b=QoQuEW/qY0XiN3GO
	rlxjcrI82zz8yAKU/+p0szhbysKvSpc7rwCrCUjbDmxl5BK+qoiqqOXu0pZOYGnF
	qDS+UyfEwseMjDZpCSbSuMjqHZP48JQd9821JqCryBXBCrkYSqXyKko4IypNFCF+
	ZJhbrK/NNDxdH6DInezlZAGx//dfjaJiJVMxr8ezkvOQGW8f7a+UOSlrvSOl6fxQ
	Iln55sjc5+d5diaIRoW8VaUXQNItTZxDD7emPZYVRAFLK0Jn0PhLjeyZu/c8RShf
	GyzuWlkqLmyWdrGxu7nWL5PQBpEI3t1XDEkNs2vziXLb/FR3NZ9HIJw1xywYbfZu
	OCjxBw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734c4k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 02:15:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845317fa7e6so4144693b3a.3
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 19:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782699323; x=1783304123; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LU9MgakiWMszdxz5hUBJe33ypmJuJW5jEJEkTuH/BTs=;
        b=jrouI7qL6x3bebrBaOLs0+RCQCH3zCFjqTFHZPsEv0+EwEA6udVe3wzDmNvSwvTxGc
         Rmc1NElaWtd/8QWWMcQ6bGMVtMUeV9mOSRuESjP++eOwihy4IHJSo5IFD/4u+EpwEzSQ
         koA0TIRuvB3W8uSSjOcOPoBj7aguBkWWh/UOEPwryr64DbSx6wqLdufc8HxFYIz1qRqB
         RXC8aJVsvaNdTX+EQnoGTTLPHBMsdIwGBpsBdItYza1P19YfEkV/7wQsrowD80Rwwebv
         1IkEfiuzYDY6K1Ssi+TIFTectvOWza0ZGkcnxL3gRWUdCkGHzl+DWs9Imt0S9Tfkggi4
         wnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782699323; x=1783304123;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LU9MgakiWMszdxz5hUBJe33ypmJuJW5jEJEkTuH/BTs=;
        b=g6bJsbXc9ANBnVQTgfILLCrv3NnALlM9PQimhYWZKGUAgNrgVkBHwWG+USrk1tu3mE
         obitdD0nSOP4ypmBucEli1yPNT0j3rW/JpDYWT4Cz9SJzRjpHQRk8Ql+WhupCDxPUi0z
         OKjcemvfr7gzSWaI33gEXn0UcsYaY0pvevrPf5QRiZLIHvgZgvkxhmsgDxBQnd2kz4yj
         KEbQ1LI8/qMBTfqEw5sg9pOYZ3U2LZK98xtyJK9jrX+PVOjPFGiYRUXRjC4q5hhCL6Aq
         KeHs+Qc9jMDg5/ffr4LkEbaTzSq7FxIYMkw5CyyK/X1lbh+yb74gJ6rZmEIqhpfaIAZr
         LUfw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4Y3Nvls9BREKHiY9Q2KRzYdLXfkIIuU9Y5pRKxGUuaHcQNKxYTZsww2txZVsPxzmoFnje7FI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt4I4FzpVrubvUlK/LYWiawrIi7idBXwUntoTMN3EMlaMmnWCY
	pumd+CQCw2sH1MpKBbVD9BsE9H1wdzKrIMSrsPwq+qLYUyM2brt61prAjba6R/7CQc5MtEIt9Eh
	bke1JN4HU/EsSYXBzfCfgV9TDb8pavJQEdkqo9iyu6P87kE5GeWQlwP2fCPln0MTf
X-Gm-Gg: AfdE7cldG8si4+1D2/kEyxBO7J/ib1vwToZOTurS4gfAntmTzJ/+er48HI41hC8Mdoq
	94e//p7ZBMjjmYycjD0ZTRuFMXB7DwNMKKATiQBlE3yKeSK3QGBUMQxj4ajLj+RpCWLvhEjtDtl
	ZSbn+JPyv7O00djEOdGJUFH5uDdNSDik2EnQ4C2NH22dr7pyUZ8Wdv7P2dNd+IcZuXhtrjUwNMN
	XPMrqvOiFw56bDjdX0Y4Jb0kjSUL/xGlYMqBpr419mYeTI/oyEr4LhTsIzBYC14HIpGc05g7bDW
	TwAts+tQgsyn9xmIlbp3CChZoM0/Jb/tCIlIYBRb5QeG2MDA/Kd2O2TA7OWe0q/xgWjkJS0pHhS
	Ccvo3Pr3ckjmcdHE/S5GoxDZiDEYJX3xEYxmXu+9/FSaRaguo6J3YVIKLajOTwX0nu1ZzTOnwxC
	87B8l7kw==
X-Received: by 2002:a05:6a00:2d25:b0:846:22f0:2cf8 with SMTP id d2e1a72fcca58-84622f042f7mr3297752b3a.57.1782699322679;
        Sun, 28 Jun 2026 19:15:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d25:b0:846:22f0:2cf8 with SMTP id d2e1a72fcca58-84622f042f7mr3297723b3a.57.1782699322082;
        Sun, 28 Jun 2026 19:15:22 -0700 (PDT)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84783756e32sm960090b3a.43.2026.06.28.19.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 19:15:21 -0700 (PDT)
Message-ID: <8fc0e9a0-73c3-49a7-af60-6c2fb1d3c043@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:15:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/3] wifi: ath12k: Fix memory allocation and
 improve reserved memory handling
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260611033314.2330-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260611033314.2330-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kBjRfAkbGsauIRDSfAdrv-BOYxeUEcXg
X-Proofpoint-ORIG-GUID: kBjRfAkbGsauIRDSfAdrv-BOYxeUEcXg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAxNyBTYWx0ZWRfX+fLdB+zb0liE
 IdybFqOjPC7ncrSgk36N9m9RuAoVKTcDU45TpnKVqTnsdGrEQwQdQpYicckZBMu0g+8EUK5zg+6
 PLO2Mn1sLKXD3gRKNC+PF0DQVjL8S4w=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a41d53b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vXKvvKVVOfj-LW_19uwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAxNyBTYWx0ZWRfX1LM7xev/M33K
 oLLErUwfntKSMJY99TDgscp+8dCOTjIzTa9NqL5GQqlYyWnUbBN8v7zmov4bDZiVCSeG7QTFsub
 mn5sEqDwY+OmNhHaOG/NbEtb2jKL4lw8sRRuu0c9LTLmm1zUi+8iyitZqkaZ609B7BjmZef20dF
 UM79FBLCG2necAqcydS4+8E5FiHbSu+Plc24hN2T4yDCc1RDwyhwEuOd6INGdzv30h2znDDMmJJ
 5zYLtxDH7NeUzlctvIYW12t1Qgs1SlRgJ+Ly7hOdve2rlEa8dwYVqhFnokYZZRDDIIVhHysogyh
 D3jBMZz3N++UeHdEN6fDtVjAPrZeDavMDeOw8Jecfv3R9aZUFdV1Ed1EBSsxUY/aJtfFpznv4FX
 8jliBGW4OulLVH3azCYPa9DSWvxA0FtHbFbklUcKm71NATC62heuxNxnN0+WhNEZMYa4ayYQVKm
 zNlz0ms62dRhq0O/yUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_191524_888097_93B4E44A 
X-CRM114-Status: GOOD (  14.45  )
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



On 6/11/2026 11:33 AM, Aaradhana Sahu wrote:
> The current implementation relies on index-based device tree reserved
> memory lookup. Different platform variants define reserved memory
> regions in different orders and combinations, making the index-based
> lookup fragile across platforms.
> 
> Currently, the driver allocates the HOST_DDR_REGION_TYPE
> starting from the base of the Q6 region, which overlaps the Q6 read-only
> firmware section. This causes firmware assertions during QMI memory
> allocation, as the firmware expects writable regions to be placed after the
> read-only section.
> 
> Address these issues by:
> - switching to name-based reserved memory lookup to remove dependency on
>   device tree node ordering,
> - refactoring QMI memory assignment logic to reduce code duplication and
>   improve maintainability,
> - placing HOST_DDR and BDF regions after the Q6 read-only firmware section
>   using the bdf_addr_offset parameter.
> 
> This series ensure correct reserved memory handling across different
> platform variants, prevent overlapping memory allocations, and maintain
> backward compatibility by reusing existing reserved memory region names
> defined in device tree bindings.
> 
> Overview:
>   - Patch [1/3] switches to name-based reserved memory lookup for platform
>     compatibility.
>   - Patch [2/3] refactors QMI memory assignment to eliminate code
>     duplication.
>   - Patch [3/3] fixes memory allocation to place HOST_DDR and BDF regions
>     after Q6 read-only section.
> 
> Aaradhana Sahu (3):
>   wifi: ath12k: switch to name-based reserved memory lookup
>   wifi: ath12k: refactor QMI memory assignment
>   wifi: ath12k: allocate HOST_DDR and BDF regions after Q6 RO region
> 
>  drivers/net/wireless/ath/ath12k/ahb.c  |  18 +--
>  drivers/net/wireless/ath/ath12k/core.c |  25 ----
>  drivers/net/wireless/ath/ath12k/core.h |   2 -
>  drivers/net/wireless/ath/ath12k/qmi.c  | 168 ++++++++++---------------
>  4 files changed, 78 insertions(+), 135 deletions(-)
> 
> 
> base-commit: 83f028be15fe071efbee8e27837538d6cca77e87

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


