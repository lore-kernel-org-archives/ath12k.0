Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621D1CDB482
	for <ath12k@archiver.kernel.org>; Fri, 13 Oct 2023 18:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7gucGzipTg2swwlIPu29/0smE4ctt/D+Gi7tmS0TvsE=; b=VNDibJxN4iw/Fq
	1A3tbulJ296V4KUZU07TyVAgK4gSIMhg0ARqdLFtsq6bBnPa9wkBn/GxSegpnXvJnW7E2PIP7wHqT
	NlxkE/9DLtme1O4goB4LY2K/bQKGEaEoIvoU2YUctTOU8mBj2AzazvDn2x20zs+O5uj83zfAaEGhe
	8gRUcquKMkIyaVSn5ps6Mj5E4swX5wF9N8ovCtZ+BSwuikv0Fj3AL5SQeXs+J+IFEHkC0meLUBdqn
	2j7Fktru1QBT7ETgAhbzTZ171XvtVp5ZoGfq57IajAUwna3adFnVGXRLcd+L/wW21BhLB0K7CaAqY
	WSXBAMWYJU/FvXKS4JQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrNCJ-00458V-0O
	for ath12k@archiver.kernel.org;
	Fri, 13 Oct 2023 18:47:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrNCH-004580-0t
	for ath12k@lists.infradead.org;
	Fri, 13 Oct 2023 18:47:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39DHQqFD029982;
	Fri, 13 Oct 2023 18:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uK62Spd+k1ITTZzjx2mazVo6sA+hYGu778NJ/qFv33Y=;
 b=jDMTp5jzeJEE/pzxiRQQj4XsYRDAyktkyQsasLeSarj58cuhCIn+dIpfsLu/R1zRJEjh
 zmTtUj8FUx1H/1nQiGVtma6VM1Z0UNoBZ11AXmVDisgiP+j96vBwf9bi9LP3zHFI7URc
 BVSXS3Z4P7w6m9yRqSfH6JklqjfLO8fX1PtVBn4u8uoRdOLBPWfopFf8Wk4ff/o1Ru6V
 TxS/cnFh/8u3XciqIOV47wiGnnC1aAfjDu1BOmW/oP9sZyoz/EGSQ37dY58xo04CX6st
 eTfSJsB+t4fh5u4t06tV+5w6aJNCE0aJJOrTpjnPwERkNK7GmpAz/CdykzJklllvDZ2R dA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tqaa2r59h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 18:47:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39DIleUB028063
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 18:47:40 GMT
Received: from [10.111.181.241] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 13 Oct
 2023 11:47:39 -0700
Message-ID: <7ee7a59f-7e4a-4390-a2a0-f585e1f12c8e@quicinc.com>
Date: Fri, 13 Oct 2023 11:47:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] wifi: ath12k: add adjust configuration of CCA
 threshold value for WCN7850
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231013114434.81648-1-quic_lingbok@quicinc.com>
 <20231013114434.81648-4-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231013114434.81648-4-quic_lingbok@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _rtsTU3t5Ed1X3Cpb4Z4rDlx6ACWjxAZ
X-Proofpoint-ORIG-GUID: _rtsTU3t5Ed1X3Cpb4Z4rDlx6ACWjxAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_09,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310130161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_114741_318839_912AC7B4 
X-CRM114-Status: GOOD (  10.38  )
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

On 10/13/2023 4:44 AM, Lingbo Kong wrote:
> Currently, ath12k does not have the ability to adjust CCA threshold values
> to meet the regulatory requirements. In order to support this, ath12k gets
> CCA threshold configuration in ath12k_acpi_dsm_get_data() function, then
> sets pdev_id and param_type_id and finally sends these data to firmware to
> implement the adjustment of the CCA threshold value.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>

Verified ath12k-check

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>




-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
