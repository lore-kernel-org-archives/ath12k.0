Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E5DCDB46A
	for <ath12k@archiver.kernel.org>; Wed, 11 Oct 2023 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+z9kocbWYwoJyGsqsTGL8z+qPh631o+w+x2zIdqkYBw=; b=ZVviTHriMM16mp
	pUvqbGWRHWT273Lo4CH1VJLfbcMSbqFqaM8/3lBr1RAtlYXlwqC/oKiNw75Uz1hvZ0uGkKfaWYimP
	/IwxAQKHziUJyXO3ps9JwijgyZfLx+P87PMPvoO2QB+pheyQZkoSk4bHkRcCaeh+c778uQxdmQnqv
	tDOFzPlS537SVtEnsnJqKyMYZMz8jP7ZTHdXxWjD668IZeO0Wt/ntHF4fTyxmQh/mq2CuuZKefxri
	aZ8Xz9r3cxdDVAaizfpgCr5DyZBLcOHrFbG4/bQGitCC8opVKZpLpjM5EYpKgJ8d+JtMUVprJTiJF
	7rI8KG+hr5d8KQjFh+0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqcDz-00GGez-01
	for ath12k@archiver.kernel.org;
	Wed, 11 Oct 2023 16:38:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqcDw-00GGdB-2M
	for ath12k@lists.infradead.org;
	Wed, 11 Oct 2023 16:38:18 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BFo6VQ029351;
	Wed, 11 Oct 2023 16:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WTMK5I/IGJa2bZV6ExlFk1oE7BpJTm/uw6d45CpXAb0=;
 b=AhDrE4rh4ANvOJ8pfLA6GrNbXxDs9PS+IFMSvpkjLyFwzknzwh+K3vZsYUYrsZ/4pbp3
 vyHbYt1GjzEdZrj9lrW4dRFqnnaOeECWpeYY4TcosUC3630ief8Lm21u0et6AyWVv3H8
 71Inc+1WHQKI1AXueh4WF+lz8MWHUjCa9pYPF8jNGDo7QQOg4AwjurTjmhkkTt1irYK6
 mbiXJHU6iFog2LILzufnbfFGmE40bvC1lcyfgWlF0dC2mvIkMMbX9en2aoQrYwA8ofVq
 bdYq9Xkdt0ffmGS8gNr9zF6yEpt9icVOCnWTFvOVaUmeMZO5EDgJ1ZINKS7WyPKMNyQv Xg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tn3s1bsmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:38:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39BGcCT3019881
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:38:12 GMT
Received: from [10.111.181.241] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 11 Oct
 2023 09:38:11 -0700
Message-ID: <bb7be5ca-acdd-49c5-b925-c04808566427@quicinc.com>
Date: Wed, 11 Oct 2023 09:38:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] wifi: ath12k: add BIOS SAR capability for WCN7850
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231011050004.423413-1-quic_lingbok@quicinc.com>
 <20231011050004.423413-3-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231011050004.423413-3-quic_lingbok@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ccEphC6IeTwdhij9Q_g2UZ4_MX0OLF3P
X-Proofpoint-GUID: ccEphC6IeTwdhij9Q_g2UZ4_MX0OLF3P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_11,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1011 mlxlogscore=771 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_093816_882099_E7BC32D6 
X-CRM114-Status: GOOD (  12.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 10/10/2023 10:00 PM, Lingbo Kong wrote:
> Currently, ath12k does not support BIOS SAR for WCN7850. In order to enable
> BIOS SAR for WCN7850, ath12k gets BIOS SAR table and GEO offset table in
> ath12k_acpi_dsm_get_data() function, then sets pdev_id, length of data, and
> finally sends these data and WMI_PDEV_SET_BIOS_SAR_TABLE_CMDID and
> WMI_PDEV_SET_BIOS_GEO_TABLE_CMDID to firmware to implement BIOS SAR during
> the initialization phase. Besides, ath12k registers an ACPI event callback
> so that ACPI can notify ath12k to get the updated BIOS SAR table and sends
> it to firmware when the device state is changed.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
