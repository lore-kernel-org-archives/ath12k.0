Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DADAC71130
	for <ath12k@archiver.kernel.org>; Tue,  8 Jul 2025 03:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZfoV35nThtD5WqTBfotJ6j0MKZD08wkcUk2S90deLQ=; b=FL5ovtIjDEt4D0RllBe7FPbcTj
	i6xwBYOsI5yKUSubiHfffwyV52ZwxXbxwINTOnWT0R7mcGH1iOAv7Dj3vzfYk/KreYaIT6+vxlzLq
	qItwsfHsjVjMlYIqU55QHa7wyqER9WLDbgtmvzSuWeo3TUsuW6G9l64ovGoi0iq5mclIRWs4EVW+i
	TtJqjSexpDyZguENKeGGEY6up/Vq97+GrJI88WOgHq6lDkDqgQypemsLbYBBaINGdJjbPg+VoncJY
	/qwwpSRfy/Hdit/cK9+IQSoj8ntoaDaL1t2STEeK9GmTA3mbVUpKo/kxmS0Y5pcA3NpkoMz4ns3E7
	a/PQRNWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYzSj-00000004DCh-2VM0;
	Tue, 08 Jul 2025 03:57:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYzSg-00000004DBv-2csJ
	for ath12k@lists.infradead.org;
	Tue, 08 Jul 2025 03:57:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567J0v2h016294
	for <ath12k@lists.infradead.org>; Tue, 8 Jul 2025 03:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yZfoV35nThtD5WqTBfotJ6j0MKZD08wkcUk2S90deLQ=; b=hRwOreP+H1otuFHV
	My4AyvKzoici6rFM+YpqH1Uwnw3Tq2ItSiiFMSyJAaqoftWloKRIeoiFK21UuwOi
	E60e9rtFB+BbEmqorryp5/U1SGBAzJ5+I7z2DBsHuuNvRBD65DjR9l/zYDduy19o
	3BYgFrH4l8JGEMBaaRJU95Xeo71SlCTSX+clw9FzEoQmCBCjZkTahJ8K+4L+ulqW
	MlizQ/7lB5nKtmt4u6gp275npiWnHdyi6L9Kl4MwXKPXoijhL9y2+TtH29KJxYLY
	/6bz3miwbwZn1yQ9XqC0ZQPYinzs7b8quUeEsOehXO6589haFDeCE8mDLoS7grn9
	bLAE7w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4xu0ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Jul 2025 03:57:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31bd4c3359so2121342a12.3
        for <ath12k@lists.infradead.org>; Mon, 07 Jul 2025 20:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751947059; x=1752551859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZfoV35nThtD5WqTBfotJ6j0MKZD08wkcUk2S90deLQ=;
        b=pe+M+F/2mC3XoaMDkc7YXF7SSZ1syBaZB2XCD0oXYjn3nIQT6nJPfxHUYHhHRrFhO7
         5Y0q88ZdPCqEkOdybPAq57uopWrmwvdKw5N/BIauZtjy0Z2WL5V8PG3VYe6bLyqZd8fJ
         F8Tszy/fD5iK4XSUHpeHdcRNyXxDVKYKq0e1L+AD1yRAehyhG8QU1XYuppiVdQ7pRI3F
         FEtEmmRQa0x0AWYRE8eusMDjV7z3eje4+1VwpGSFgLutPF9FBbQhvmy+B5OgKXNxRscu
         5tqFXGNIVogUQJpYb0ZkKpBIgQv9JDzqWG7ZGScKY1NAcnAmgG8YnWPSzc/o3pe6wCml
         6vcw==
X-Forwarded-Encrypted: i=1; AJvYcCWp0OWMFCKehb/SVWJv1sdI1zzhV0P4ekehHJHL7J+wfRlx0mbQonJlhUK+Dsxe0uJAcunwV6w=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsOLAcHP8qis/AHMl0dEFWLzszfj27Mg0XBbqb0xa6vsKd8joV
	AF41xqBkB8R7vm5TXXDT/oSCzaQyhsoAYu4OKC6BHq9nzjsHxjGmqO5l6hLInu4BO2G9LBenGOW
	8wX+zK6Ttf+jSucrbirAXXKu5Q+09NbRKmFb2rHvdZ5zFNCyTRAFDCVlyGmyc+vbUM4/Cha56
X-Gm-Gg: ASbGnctSUZO1iW+ukRYRQCO2ycjdCJfDLFdcFs6L+jc4bUs42iX6xFbKsVXIqrvey+t
	wnjwKLOZRXCkv6+E9Sq4CSUNW6vM3j7kmqM1BoCWLNppvPWFS2lCaMoSmuDP41g2X2jFQ5Yus/H
	HTaulEI/7WeE7q1GtI0E2J38ORUD37rRl8uommN36ULDARgZrD4PiyHDO+WYozcn0l1uN5qibWh
	Nwleupu2bxW2qsPnSpRvCMd3JD9RjyTKFGEpH24dhbUQasZqa//zD6ZV3S0QcfVas0tbnmwF9Bg
	zqXPlPbn1q6wt8lAZuhrRIephhK9gZn1XExzjDYE1eYwtxM9AN/Efhh89ZivhiUr
X-Received: by 2002:a17:903:22cb:b0:234:b41e:37a4 with SMTP id d9443c01a7336-23c874661bcmr162472215ad.6.1751947059492;
        Mon, 07 Jul 2025 20:57:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNFICRHa7VZvexK3NXDeEaLhBdYhMsxrimfFDSMc6Y4BPuWgjrSA1CRVsT1lg9P24SCJdd3w==
X-Received: by 2002:a17:903:22cb:b0:234:b41e:37a4 with SMTP id d9443c01a7336-23c874661bcmr162471965ad.6.1751947059035;
        Mon, 07 Jul 2025 20:57:39 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c21edab71sm870043a91.43.2025.07.07.20.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 20:57:38 -0700 (PDT)
Message-ID: <4bb50d07-f2e1-42ef-66df-9f7914a3bc31@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 09:27:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: update unsupported bandwidth flags
 in reg rules
Content-Language: en-US
To: Amith A <quic_amitajit@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Harshitha Prem <quic_hprem@quicinc.com>
References: <20250701135902.722851-1-quic_amitajit@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250701135902.722851-1-quic_amitajit@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDAyOSBTYWx0ZWRfXzAeV/Ro/Itrb
 qad6T1hkQFk5j59qxDe+Eebvh6Hkd1u5Cs5hiGh8FwI+UBxHOFy3ep7Nc37kG+yu2kqNWXxD5+O
 IvRfv10NLyL6qgGbrSTN+j/YXyDDnHU7r6Cs0Jd2PQrkVBch1qGBZWvDv2NFkCQr24IhUy+zIbT
 nF9KqBkefyJQnQ9ftticcboczLha8rvK2ypt6m5BxclwjMeXxuzvQvvotgRxkeqCF7w+TsAHygG
 JlAZ93JxwGAhAJQRp/z0VsBtExzNOE6aiFb3xCma3tU3RDXxLWPYui1ucugxVHkRYFekerf0WUp
 b2tc8yo7bxqU85iHSL9YGl/vVk4F1gP65QWhsS/EdOsqcWG+DD7c4SJdnD4VBIdzfNOPX4pNyrh
 agP7UsBZruQ8/JHemq44ChG8lt0W+hAxs7HR8aNrfgLdXeAcX4qvz3fEtuamlrHM5SQTG6kC
X-Proofpoint-ORIG-GUID: PXa49RazD5L6AB0RqKb7572NPkeaYyQg
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686c9734 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=BowXkJOPuL7utAKXUaEA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PXa49RazD5L6AB0RqKb7572NPkeaYyQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=977 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_205742_812182_FDBB5D26 
X-CRM114-Status: GOOD (  13.34  )
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



On 7/1/2025 7:29 PM, Amith A wrote:
> From: Harshitha Prem <quic_hprem@quicinc.com>
> 
> The maximum bandwidth an interface can operate in is defined by the
> configured country. However, currently, it is able to operate in
> bandwidths greater than the allowed bandwidth. For example,
> the Central African Republic (CF) supports a maximum bandwidth of 40 MHz
> in both the 2 GHz and 5 GHz bands, but an interface is still able to
> operate in bandwidths higher than 40 MHz. This issue arises because the
> regulatory rules in the regd are not updated with these restrictions
> received from firmware on the maximum bandwidth.
> 
> Hence, update the regulatory rules with unsupported bandwidth flags based
> on the maximum bandwidth to ensure compliance with country-specific
> regulations.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Amith A <quic_amitajit@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

