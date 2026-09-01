Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8FAC61DFD
	for <ath12k@archiver.kernel.org>; Tue,  1 Sep 2026 01:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLB8BcqtseItV55bGvx+qIYw26TP76TQUsHtl0K/n/g=; b=WTgHXxsJHieLNIgGq+V30ev9Pn
	AXmdjJ+kGSFxKtJ+czmQfHmOF9fOpmfgvzON67XMGxNR84fxexXIycfODUHRAqM8QyCEr4M4BQo1l
	nd8nh+nHU9to7HB86j1EOROzN0QOnmB2ggFJ5ncaek80ihd7/iByEbJnBRCO32HWaWWYElxH85PsC
	hlLYCH3BWtJkmqfPsYFqCVhghEA7qT4JZMY9YKtc+Sf1qBbSTDzUM26+o0+od97KpE7Vi3y4jSha6
	YaxEHyexqifGLFv40BnDvuyRLlRKhwS+g7woY/xMyFYEve2QldgY4qpu+BX6fBKNzrhgbDdkZRzZo
	eYaB5p7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Dg5-0000000ApGK-1Btj;
	Tue, 01 Sep 2026 01:52:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Dg2-0000000ApFn-2s6l
	for ath12k@lists.infradead.org;
	Tue, 01 Sep 2026 01:52:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810oqmI1061516
	for <ath12k@lists.infradead.org>; Tue, 1 Sep 2026 01:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MLB8BcqtseItV55bGvx+qIYw26TP76TQUsHtl0K/n/g=; b=oa5Zy7+VBd8W9e3S
	gR4t8pLDJ26qZWgtWUoJQg4p9U0ZxzeUpd+dZGjpWArYLnnuqgHjRSkTMqWHNvI7
	J0c9DoKgEBPAE+R0RtAjzg1TvnPCcpRpRyMmPi/evGR6oL23QEaRPao1NOzFK3E7
	aRI9eOLT5WA+I3TA1lAk3g0Ax8MfC71/8iZLxXxVc1UfSH9iU6Le5Wb3iESe6D4I
	sAQ4Goj4MeNNOycA7wCTY+Od4sXDqwKIs779dNlxIVvuf3mays58IFN6VxyzEYbZ
	jrPnb9i5+FhZKF9ZfSStCaVTjD/Hp8El5d037lv1gBewJuTDLpaEARVRjA6ETy/8
	9fyYDQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6rbc6fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Sep 2026 01:52:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dff6253so4818525ad.1
        for <ath12k@lists.infradead.org>; Mon, 31 Aug 2026 18:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788227561; x=1788832361; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLB8BcqtseItV55bGvx+qIYw26TP76TQUsHtl0K/n/g=;
        b=aJf1dKOWBn2Kn2blYORU3MBvuynHICJx2K26Z5+8Gnv4ptEmiDvcdWS8IF1ISIDryH
         tKPeU/UoEO83ESwMWkxDamEmes23xdN7sYwLrwt6ElpBdqQwZJf9u2H3qCMWIodpELDh
         X7za3uaMWelMtsYzMc/Sc5rury50BqQzSjFvZkCf7L8szXPflCtwd74JPie8NTwq5kaO
         wlpVN6odqlhUZrxaOhJSf1yU1KdkPu/uf9S/CADAxmkMFQMv1VMpUsaOwcBCeAJax1at
         InxGd8VOF2VYiMyGBH1gLzb6Co+RPrrCZUUKWw1PrxU5+tpHVQsbOvhGgK2sMjqwO17l
         kb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788227561; x=1788832361;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLB8BcqtseItV55bGvx+qIYw26TP76TQUsHtl0K/n/g=;
        b=YL+8vnUliqajJEGRTiLo9mjwru+e2cQtgj8BFmZDZ85SVAWZfXD2AhsdQknVtpJebB
         BezJuV7rYq4sTcCVf3y6k/sJHPbIi4PbfKWuvvUmXKBvbo/4+hdl3vx7IP9RwatEHJgC
         GNDtBp787MQ08uAPU8O6eU5wj0Qa0b30DiGmkZJ6Ao+P+8J+xYFFC0utq3jqKm/jvAqP
         lKa3Gm2Ty6AOL6ugAZpy4AZ1qZWjHqnAWg6gyaJiuE4ZQcLe1aC0a7OM168gtMelv1vf
         G709Qt9e7DsaLBu4uVVF/+X/bQ5qC/Me9DC0OhHZ2+I61Iz9yzY9ZZ98ixdi0T/siyNI
         PyDg==
X-Forwarded-Encrypted: i=1; AKwUvBxP7nMiyI3hhSG0yQxIbitHnm/2asrHesGw96DGUa5/YJXBvPtwgHroLRqDjkdPv6l1s3KBgiA=@lists.infradead.org
X-Gm-Message-State: AFuF++kgBWOnUH17IqH9u0p5xNEebOZ2OoNkE0XEfM3S34B923brcAbZ
	39/HYfstANSjsK5aAsRDW5+Z8gKt2oFHAUKgY6KNcRx5AS5Dpls+N9g3GrIdw6znKPZNiM6sZSd
	8PRw7cBe7jDSENGTd1dXbCKTtrBJBdO7SwDFPqtTqL89xGgUxIOdWL4U53bgrbygM
X-Gm-Gg: AYBFou3mztSH0sAaHTrETvW5czoQ7J3XtCIJh5rv7OGVQ3fTW/vaXRJDRV7q5id1bMR
	+gmD3y+tv+lKW8728rBvqwoOpVbnkgkyb+VqOvOKaQcfK43WoUgdM5AnR42ys6RIsV/SVX7YzK0
	6/CdMIpwxo2oHZCrOhiMVWId2Y6yD7ZwwkCvUBp2hwccDK8NRuzsymFuiKkp7N0eVWy88TRVKC/
	UTyPZoy3y6hZdDSciwvGBGek1ufXJjfvH+Lb7hEhpLmXebuzQvxTDZMR0YXpQ4EkwC3eoAYhALF
	asDnXS5N6cF5rskI7i3DrZecLSofze1LredQcj4OaOU+fmagwMRS5YG9WKA6jG6yemdh4BmEH6z
	90z643ZalHDHSzQDjylMr7/hIAV9Nk428s8boUwHwcnWkh4IIfopL4lcMaCklDcVfwMYEZOBd
X-Received: by 2002:a17:903:37d0:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2d9526d3436mr20524515ad.3.1788227561301;
        Mon, 31 Aug 2026 18:52:41 -0700 (PDT)
X-Received: by 2002:a17:903:37d0:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2d9526d3436mr20524255ad.3.1788227560883;
        Mon, 31 Aug 2026 18:52:40 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7598bfa51sm42590745ad.78.2026.08.31.18.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 18:52:40 -0700 (PDT)
Message-ID: <5d6fab0d-e31d-4a81-a592-30ee1c6f295b@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 09:52:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from
 device tree
To: Andrew LaMarche <andrewjlamarche@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cImhvbAwM-B68zKHxhIGoF4i52QFqNI6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAxNCBTYWx0ZWRfXynGVHOcu6TTb
 zhj+u1nJ1ZrufxF8ADzH4E5dwQOJ+t/HAJ0yrsEYB4u4rUEdi5f8KGfQZqB9FymrAI+xeCgsQz5
 lB4SJk2MKX0q4szYU2+nG/pI/zchFf3c5R54IWb3P/VEtgimXQwDHjpLu4fkIG7gqFhyZhGhpA4
 QTdV6mcbGP0Vgn3NFUYnFuUblNGzSpq6qeRC8j14rNb/BskaIdYHl8iiUWOpWG5Qe2C6RmOeI+u
 /OuendQd6+iBUJoKvgv9GubMQnpRN18NbWMOdB48nBi+9+8ohKa6jPa2yYCJysaxUO0KfE6KDnj
 oJ1CKLJTa78L3H0mRCUwWLdT8mAsOqmxRLDcTLXHm4VrtNjTyy2xLi8bnEesYMmlwwAUzCahF3x
 M3rKhmFWAokX0ikl3HpLIuy7MMuAxV4f0MjR9M+nsMYsuUH3xPZ/a/NMYmPyCm03O21Kw2nnPT5
 VEmOvoQfaXYjk/PN1qg==
X-Proofpoint-GUID: cImhvbAwM-B68zKHxhIGoF4i52QFqNI6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAxNCBTYWx0ZWRfX0jH7pgs4OZqF
 wumsFWHeTtE2xXYfKbDQmaQZNcEOEMlJAqVpmh94ybpemy8RA3UkGRkd/ZjFT/hB4T+e8NKz1ad
 BPeefv6sV/vDOkKZMf3PrsfJw6rLzh4=
X-Authority-Analysis: v=2.4 cv=d/fFDxjE c=1 sm=1 tr=0 ts=6a962fe9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=erCTOyO-HGHO-QmL5V4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_185242_728752_6A07E998 
X-CRM114-Status: GOOD (  14.60  )
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



On 6/30/2026 9:30 PM, Andrew LaMarche wrote:
> ath10k and ath11k support reading calibration variants from the device
> tree to locate the correct Board Description File (BDF). The ath12k-wsi
> binding already describes using qcom,calibration-variant but it is not
> implemented in the driver.
> 
> Many ath12k designs expose all the radios under a single phy, each of
> which typically require a separate BDF. Without this, the radios may not
> come up or will not be calibrated correctly.
> 
> Fix this by parsing the device tree for the generation-agnostic
> qcom,calibration-variant. This allows the driver to properly select,
> read and apply the correct BDF.
> 
> Signed-off-by: Andrew LaMarche <andrewjlamarche@gmail.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

