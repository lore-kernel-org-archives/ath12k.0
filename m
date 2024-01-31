Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A2CC47258
	for <ath12k@archiver.kernel.org>; Wed, 31 Jan 2024 21:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4k/u9SVUpdbuUEXcHsuiYeazu1ERi5N3vIIoVM8EDZ4=; b=V5OGp3D7vwAJWZu9nKNQ6BgA8W
	GAbZ/fqMPXxb0Y8/ANGo8zEOdGl3TUzqrvqNpE9OT44EJq9z5UQp4zIVCSidXdFhEw5qJhw3CmNBS
	LWkmsN0lHbm9/FuhzYKlMxjN1rTY5sIw312O21vqjOs9akJsgHt+LWifCb7u6Nt5Fix/lP9idPSU+
	42j+A1glPCf96mufFIHxCUw2TWNe8lLvVjOxT8MKsBCIWcm/77+fou3+V721qXeq/wmNfJmpBNlFK
	GBIoM4Mrp6JtNUw09d9GjHSNugDexU/N5z8ZacnoCHMRLXil2hzWLieiCG1iZm8TZnuFadvALR+lI
	ccHyWbsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHlf-00000005QlL-3HPs
	for ath12k@archiver.kernel.org;
	Wed, 31 Jan 2024 21:05:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHlc-00000005QkB-2KGB
	for ath12k@lists.infradead.org;
	Wed, 31 Jan 2024 21:05:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VJVdHE003079;
	Wed, 31 Jan 2024 21:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=4k/u9SVUpdbuUEXcHsuiYeazu1ERi5N3vIIoVM8EDZ4=; b=Bb
	7/6lPoKUQE16PQajPa0Tn+OTA4k5jXdb4goN9N5HpqEDPMBulwfegqlvcFkbCGBq
	mxu9yQk4PTYhsj3n/UNWmBlm96SOBfrFDmksngeABoRkUkZNVBUWxtmCCqWZfKEr
	BYAdfisXb9ChDgsptJZaTdUw/joP9IEPRxK6X1Ur4FuJ3YuH3wAkY62UGCui0GLG
	2GjBhhppJzSsUhzewioM+3Z296Uop8sL0GR6HLMKfZ5LxK9nkFrqgIl/gZILm/yL
	/HBZ8fvxj9kBap3iisadfMyTAlqYhps0CrxBdgYXzkCPXzYo1DmRPn2aC9MrSrqj
	UW54l+2wkJAl6Tq0hX8g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vygp7j7sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:05:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VL5760020217
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:05:07 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 13:05:06 -0800
Message-ID: <d595656a-bab4-4fa7-a988-60a2f4c7003a@quicinc.com>
Date: Wed, 31 Jan 2024 13:05:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] wifi: ath12k: fetch correct pdev id from
 WMI_SERVICE_READY_EXT_EVENTID
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sowmiya Sree Elavalagan
	<quic_ssreeela@quicinc.com>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
 <20240129065724.2310207-3-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240129065724.2310207-3-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rYlbfGy_FSwOCgvwXtVfkwGnzqaRpXol
X-Proofpoint-GUID: rYlbfGy_FSwOCgvwXtVfkwGnzqaRpXol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=513 lowpriorityscore=0 clxscore=1015 adultscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401310163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_130508_640473_57CB6EAE 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
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

On 1/28/2024 10:57 PM, Raj Kumar Bhagat wrote:
> From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> 
> Currently while fetching for pdev id from WMI_SERVICE_READY_EXT_EVENTID
> we consider 32 bit pdev_id in ath12k_wmi_caps_ext_params structure. But
> Firmware sends lower 16 bit for pdev id along with higher 16 bit for
> hw_link_id. Due to this wrong pdev id is fetched. This wrong pdev id
> when used for WMI commands leads to Firmware crash.
> 
> Hence fetch the correct pdev id considering only the lower 16 bits.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Co-developed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


