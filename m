Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1D1EE3F11
	for <ath12k@archiver.kernel.org>; Tue, 12 Sep 2023 19:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKWCA3t5Frd3guUFPT6DZ2YFYjA/ZIBBtpnU06gcWpg=; b=tPP8IAQgtu+yuH
	X8l4S8yK3OxjG/i3Z/vZBqCUjRoSsiT4P/GUR9aY4hSMHiYxyOqGXJ3ldMT+0Sj9e+sJh/yoQ0wej
	Z1ny9Yz+SWa2Go5kqoJSofrar2+1Bz+xeAP6b8pZypwGn6GPUbsEPlmrhubTC8Z/N3lVIrPMm81qO
	vh2Coa799Xo/aCQhClF6QIdJUW6oTZJYZWNpTa7MYkrYZbgeUnLiHZpyQETR+4CeokxBm6Quxa5Oo
	mHfa9UzNzV/4BO5M+pOaLmw4j52a8A5VNWnGA+1vGZlQDhQcIEBzWB6o8E5D3g2phmM9BGUf2Wl4Y
	fmnoZ61xd0/Yx047s1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg97q-00431H-0h
	for ath12k@archiver.kernel.org;
	Tue, 12 Sep 2023 19:32:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg97o-00430y-0U
	for ath12k@lists.infradead.org;
	Tue, 12 Sep 2023 19:32:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38CJUCDO011433;
	Tue, 12 Sep 2023 19:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=IMeMD/8Xt3GBk37J4/Uu5vIepB9e2LAnv8IUQLKRqd0=;
 b=i0jTrMUu2JZ61SXWzZWvu3Eq+ZYnFwkuMYRhOjApq3InmpCrq5jDPO3e3UahixE2BkXA
 EHuMhlahytzYV+ERdhJdlfLGLqYMaSDlKo5luXyZlO7IYvBZDsjdATmMPssPbaMzoCcj
 0ak4zMNAioAKggSwwjwFfE1msmH7Q92VJSySIsHMB+hjvOyOVSqgglc8NLJ9S06N3KhE
 DQgV2Gm6fG4ZYuKto/s11Ll4KTlPgN0D7gEnMWCEaUUknq2nRFnAhcBgMdTqmElevHY+
 zXgde5gCQl7smBPBjNGObP9R4cTHYi5FDOUlIQdUnVYuvaO76Oqms2dYSrNhJmkPvC1I Nw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t2ncp1per-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 19:32:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38CJWdPL012954
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 19:32:39 GMT
Received: from [10.111.183.71] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 12 Sep
 2023 12:32:38 -0700
Message-ID: <4159a107-2231-4e8f-93e5-bd42873f4c14@quicinc.com>
Date: Tue, 12 Sep 2023 12:32:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] wifi: ath12k: add adjust configuration of CCA
 threshold value for WCN7850
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230910082802.9198-1-quic_lingbok@quicinc.com>
 <20230910082802.9198-4-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230910082802.9198-4-quic_lingbok@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oH6OyN40526oNvoW4rRQ3NoTG8RvO1f6
X-Proofpoint-ORIG-GUID: oH6OyN40526oNvoW4rRQ3NoTG8RvO1f6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_19,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309120164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_123240_377164_0839F96F 
X-CRM114-Status: GOOD (  11.38  )
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

On 9/10/2023 1:28 AM, Lingbo Kong wrote:
> Currently, ath12k does not have the ability to adjust CCA threshold values
> to meet the regulatory requirements. In order to support this, ath12k gets
> CCA threshold configuration in ath12k_acpi_dsm_get_data() function, then
> sets pdev_id and param_type_id and finally sends these data to firmware to
> implement the adjustment of the CCA threshold value.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
