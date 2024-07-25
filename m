Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19A1C3DA49
	for <ath12k@archiver.kernel.org>; Thu, 25 Jul 2024 18:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atTuAT1d+WP+JmcUTjKIb003juBpeadAgbOBQ8ShZSA=; b=wZZ8N08nqcq1rVFywe+S0L5e7K
	1PBIWW3laIUtT9xnUbXSJFfKxqlb2LMi7fSnPU2Y+rB3dLmGsip79FTWknTkSxDVYYuWeZq74iMzI
	ZxWy32HpLZHzk/rYUHWUWu9Hfg8lzuJWKfe13H3oHhRNk4jmylI0VcfWO+gdKKblodmkR0RE0MCZk
	1GQ3xBq70ZyUE56nFlBkGGOaTriF9hPUyF5K/R1fCvB9M1zFX6zu/z6JeCclVPWvm2gc0lqAh6JWs
	VxF5KE+jzkTjZI5mPsKsxnuzGmV9amzrFgDi1a/Co1Vyp9CS579H5d68ibxB04Oc4HVUdFr1fY56E
	tyTCseuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX3W6-00000001p6n-2vq3
	for ath12k@archiver.kernel.org;
	Thu, 25 Jul 2024 18:48:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX3W2-00000001p6E-1Cy4
	for ath12k@lists.infradead.org;
	Thu, 25 Jul 2024 18:48:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46PA1UIY019617;
	Thu, 25 Jul 2024 18:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	atTuAT1d+WP+JmcUTjKIb003juBpeadAgbOBQ8ShZSA=; b=bTdn/kJFial/TPXG
	zwR5KJdkHWNcx59pQGV7jADaRSzHwNg7wBSVoKXJCX9R5bX9Tp4nSHMwuSqUF6s9
	IcGRPWfi1xV29Ksi7YuwIWiPi2NGLjY0SqwYRbcJs81lDB2Sa9QPi+pXdnPt+JU+
	NCI+6rtqG7BSIyn+r7Y2oI8Dn9u5cm5yqplun0O0ek4hmG07bGnQjIn4QSl9B/3T
	/Y9UYvtS6kLT+RcHQCr/5nhtPxNDR/YBJgW/I18bOkNCUDLoCoB1z0t4RyXsZpp3
	M8VyMCEtJq60ZDHR9f8Oj+e9tJjLqec/MrG5zd5br3DLa3xRgfA+MzEzqg+XRmD7
	Xfrb2w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g487p1e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 18:48:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46PImZwi007611
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 18:48:35 GMT
Received: from [10.111.176.36] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Jul
 2024 11:48:34 -0700
Message-ID: <7c67918a-98e3-401e-b1d1-bd2f1e08b2ac@quicinc.com>
Date: Thu, 25 Jul 2024 11:48:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: prepare vif config caching for MLO
Content-Language: en-US
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240725094836.287448-1-quic_ramess@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240725094836.287448-1-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wrSKANme3x7uJR5lcCVIwYX7PcUhNd0S
X-Proofpoint-GUID: wrSKANme3x7uJR5lcCVIwYX7PcUhNd0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_18,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407250129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_114838_590414_E46F3FD4 
X-CRM114-Status: GOOD (  11.92  )
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

On 7/25/2024 2:48 AM, Rameshkumar Sundaram wrote:
> Currently vif configuration cache pointers are placed in arvif and
> caching is done whenever a link vif configuration is received before
> driver created vdev for it (i.e. before channel is assigned),
> this is possible because current code only uses default
> link(ahvif->deflink) which is preallocated.
> 
> With MLO changes the ieee80211_vif drv priv is now ahvif and its
> arvifs(link vif) other than deflink can be allocated dynamically
> during channel assignment. Hence maintain link level cache
> in ahvif and whenever channel is assigned for link vif and vdev is created,
> flush the corresponding link vif cache from ahvif.
> 
> Current code uses cache of ATH12K_DEFAULT_LINK_ID(0) which is the cache
> of ahvif->deflink.
> 
> Co-developed-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


