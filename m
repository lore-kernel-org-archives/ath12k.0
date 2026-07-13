Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1E8C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54aSgbJTAVEXIL1r3f/ANoogoAnhGadGwn99SJxuhf8=; b=pJaNOXx1ZnI/kZgqP8DUNnlFQt
	aGQmqyPYDNHO6ts2bXQuYsEazjTSkF1kfCYxVt5EOjlLHQEyMJvg289D6RyVmLFV49gzgXOEsZKxd
	bolcEaTQTAmvV0GWv6OVuLB5XE5b0zCFblDD5oD5H0YRdkjmUbV31lJV0eMXoNIpa9qLWncPGo8dq
	fOzelyr8P/mnrSxXZey21vurZydLiKFqX8QxTf15AhcXOvfL3OkjXNK0TvXO1UvVWsTASD37GvtJb
	kdJQBQo6PUYRvKQlnrLWhnMmAbZOF3NCre89CGcCrr98juEJ7AmnEtquXPL9NAnXc4xK8T0SrIaZK
	ctpvB3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAnM-00000008LOe-2ZzF;
	Mon, 13 Jul 2026 07:09:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAnH-00000008LNB-3OLI
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:09:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nxud390909
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	54aSgbJTAVEXIL1r3f/ANoogoAnhGadGwn99SJxuhf8=; b=bnRTVtvtojw2+pKi
	WVJmT1wu8P3YdB+UWPnz3f3z1i6LFyOLJm+3+CLK1G/JkmXtWoshmI9GVILMCTiP
	Vh9Xi+8WiBlDpxbCxwW9tkgKTe+T2f/uu2O+x1yY3ddY6kAv+PWVe3aSLjRFLTXi
	ykRp8axaCzmOUO9Rcg67009KrO9ku2KWHkMjiKH1hN2kJLsNDH7NyAFqT0pcwHF/
	18uLWdq3K1mK8Ty6QaTBRWTKZTQkcGEilyF4WUe4ROhiXYrx5Zfvhl+CZdXqAgCd
	PkVZ+FksQSfikXeXXEPqrE40hVtYhbAIt15pjQ28dOWJeqE4+u8bXJi9UZ9LVdz9
	41Z9CA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gms9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:09:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38869800848so4731506a91.0
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783926575; x=1784531375; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=54aSgbJTAVEXIL1r3f/ANoogoAnhGadGwn99SJxuhf8=;
        b=LDcUm72Jv8rBoP9suLt8z3bBe3YiTAdZlAeM1e7brc2vtmAiw+waLWVdobZ0PYqxKN
         19XZFbllMPrsjL5UNOjPUvZXTYZmU5K4HJUZKZ1v9V3CxGN7ILpH+9k6wjrBj3yzbD9v
         CBe0y7HUgY+sCnKiGUjmYZWBUXLX6cuCx6iZl+EVRV4UCl5udwb/0f7lZezC+waoWKwN
         pQMETHfsSGbsUVOC0DFyQGpIrg+XTTObOgacATL86pCl5vOjLr6jAFmvehY5i5C0nYCZ
         FnUuXB9ZDjvOXdi1ft4S1G3phh9yMm7M1h0Z5JmAwKZQO1b+8fSkpHzP13stK0v4Emza
         5WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783926575; x=1784531375;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54aSgbJTAVEXIL1r3f/ANoogoAnhGadGwn99SJxuhf8=;
        b=nmRGxIXtsMvvPch+5dAfQFru4sLLPHgTS0EXxKUzYANhgkFFbTL9sutzX44xEhLVeu
         pZ623NkK8kKdlIpgJdvphyoXAEDe4uj8G4yS667YgMdONMPx8SCwb7tZGG7WdXmFvorw
         TQ12KNsunQ0Yi+iw82Hc6v8pKRMPAhC8vfmZ70/FALkz8sW0nFfwQBoHqw9ay1RfVJta
         UNLcIoy3SKNgoZSW3p0wjGlAueKOPNFbqSf141wAMO2xU8F9WN/VfPHED8ubHYhcPgsN
         cttWMdURdJLschYtwihMtemZf1u8TydYDH1Ol5Fq8mmbO6J85jbepfdoWup7ZBtPSQT3
         HXSQ==
X-Gm-Message-State: AOJu0YxTIzqDhZGYKFQdbg17WpESB+vAaPt1mV66cnkojVUt10r48qVv
	zQG+Ww5VR97OQ4MnIwm5N7DKDz+gzunIIb899I/RarIcou0FU4vfVedo1eNVCwCNO7eaZ6SvPnM
	ywZBulxCIZQAz5vxLNYhUb6lUoyLW0J7jok1eLopJkyn4in9RGgR4KGM25gTesUfK
X-Gm-Gg: AfdE7ckruZzQbP1ngIOLeoGHM+qWqE/onFUwIyFormtBhAQBfZaJA7b4AkbfbEumq1w
	0NOUXlrzaSI+Sg4kbcKPcg2wBh43cCsjUXXNzschu5VV8XqP8OlXwN8dtizetcZ3AlTQ/s63gAD
	9nh9V3S/X4Fa7+spOYvu237Mu/aUOzClhlZPlLq1KIDgubZ1Z4Y78JYYCCN+2jDVf+TiuMZioaP
	DWGY6rGrpU66hoWSDvenSk0zJCs5hJvFtfEYIkY867hSzrr462w0/tKoJU2sPXyJQ9LKpKhl1N5
	3qI+6zkpOChbqOhVv3LjUw1SIbUOWfISrE6IWfzZXEgisrigl+PyxWu6CiDH/EW5NL5DVCbdspM
	88pIMmJiVkddfZSJoIp3lMpH8Xl5scF0zjW/Srr8JPW4NiKRV2Cc=
X-Received: by 2002:a17:90b:510b:b0:387:e0bb:57f5 with SMTP id 98e67ed59e1d1-38dc7798fdcmr7551754a91.38.1783926574738;
        Mon, 13 Jul 2026 00:09:34 -0700 (PDT)
X-Received: by 2002:a17:90b:510b:b0:387:e0bb:57f5 with SMTP id 98e67ed59e1d1-38dc7798fdcmr7551736a91.38.1783926574250;
        Mon, 13 Jul 2026 00:09:34 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm49182704eec.22.2026.07.13.00.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:09:33 -0700 (PDT)
Message-ID: <47dbde08-bf2d-444d-b2bc-b802289205fe@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:39:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix rx_mpdu_start layout for
 QCC2072
To: Wei Zhang <wei.zhang@oss.qualcomm.com>, jeff.johnson@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629061529.1993932-1-wei.zhang@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260629061529.1993932-1-wei.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a548f2f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=EB44UgcCvd3G_oUa3FEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: NC-qlyPWCCw4_fKkoqbAlXjTDpasZwLl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3MiBTYWx0ZWRfX+iHNdLePOJKO
 jHbI3KBGuz02Rnigm+5vcQ9HZmPpyTruOuxVAgrlWrEVIfNvprtYYiYCiKJCVBGTSbL/oSYk5ec
 jNZs9M9dS6+Iw85knOHZM3io01nSOAddw964RCOzkjtj9npVGEFZih8DmzQ1WuIGEpB9HE1L4vM
 67LOL2qRcriCfTrwsBvUrGyuaPh/pV7riQY+DwtctgfKnYOCW5eyqNO2QhKmnuFZGjaSIO05+t8
 mdKTBeFRHO6wBZ7XMQ5xl7lecZPbieK/Ef8eIYKPTV1tJU+T+mCzdJxxsv4HsOPYkLeemgVGXv7
 feYx2mYX/ngNspHu9mTjZnoD2GoppVwJYn5SIMqk7g+iiq+tD3jT0qAkE8ntjhheS+Q+XxqS1Yl
 Zo2he4K5vGJxD5yrIcVyDnoKM8A6vUgs+EBW6XSXdAXYJXY8rvJyYqbnNLuMiNyMK/pja/aCtnr
 62cfgv58/WlM9oee07g==
X-Proofpoint-GUID: NC-qlyPWCCw4_fKkoqbAlXjTDpasZwLl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3MiBTYWx0ZWRfXzjNbYG3Rj9zI
 UJF8pak4mXqqCsVwajGvCLtVuSSElfUU2jO7a8E9hxo5HcIful0Bl5zRzUm/A3JjB4wKH4UQ/ey
 J9mCGJ5U/11Feqlejaw/6Ag9Qe1Aij0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_000935_881835_D20D7AC8 
X-CRM114-Status: GOOD (  10.09  )
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

On 6/29/2026 11:45 AM, Wei Zhang wrote:
> QCC2072's rx_mpdu_start TLV has a different field layout from QCN9274.
> Reusing struct rx_mpdu_start_qcn9274 in hal_rx_desc_qcc2072 causes the
> RX datapath to read the wrong offsets for info2, info4, pn[] and
> phy_ppdu_id, producing corrupted sequence number, PN, ppdu_id and
> mpdu-info flags (encrypted, fragment, addr2/addr4 valid).
> 
> Add a dedicated struct rx_mpdu_start_qcc2072 that matches the actual
> hardware descriptor layout, and use it in hal_rx_desc_qcc2072.
> 
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00188-QCACOLSWPL_V1_TO_SILICONZ-1
> 
> Fixes: 28badc78142e ("wifi: ath12k: add HAL descriptor and ops for QCC2072")
> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

