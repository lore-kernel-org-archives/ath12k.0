Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3055AC61D90
	for <ath12k@archiver.kernel.org>; Tue, 21 Nov 2023 16:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W27IWtsiS06b/Q4DczuQ2drXiBh1vlWlRhOcRcDw5+I=; b=h0EAKoEC/ZMeN9
	UsBU2btpCkH0HN8ORFpuUo45ajOzAKhtrok9YHYKoBQV7OygpN3+skwuTsTcqJoMIHld6uW6rOTc4
	/0mV1Mc6mwdKOI/EL/u0squp0n6Or8smtj19hzbY96CJBgKFuS18nilRiRhgWnFs0veM2nie9tQmI
	F3NxLZ0mZWaj/FeMWyw68NnNtlsCCS1WpprQ859n+1rLYr614G6dLkQko61Sv8NMexuVcSr+Hn8d/
	QWayJrwU29p/JMqhCY3jXSQW3c20evbP9dQw7vZcHhIVLupetD0qUjo1coWhSrTUgReMgWoTPJE2m
	AM5sxX49vF+7MZ/IyeLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5TIH-00HFCX-2l
	for ath12k@archiver.kernel.org;
	Tue, 21 Nov 2023 16:08:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5TIF-00HFC4-1r
	for ath12k@lists.infradead.org;
	Tue, 21 Nov 2023 16:08:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ALE28L1030676;
	Tue, 21 Nov 2023 16:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=e7gXK6mk3uKdEXhwOsDKiEYSQrqFtxJZJyGhIYbeYa8=;
 b=IeGfh6qdQxHAaesorPwhPDCUd+7Hi7+33Cf2L2ExCq8X4yq8GTk5LXmZOjfjgBKb8TIH
 0ryUxzLThDSHgxEuAt7S092oluxz7rfOGAD27aZAsCnsJ+3chT1fYDOFLGaueDSFcW0O
 jknRLnZxp31oDM8ervqgSBIguGRNVTO4kMGVINz4PRWt/z8339VXnNHsq7lEh/f4+VCR
 d5WTJpnJQJoXKCAsKBUc6OlwouP9/U0HP2NwuhzC3x4jhsouC/r0zrplEwy9FE3e1pHO
 36840VIHhfw3xucncINVKJUuusJBgN6LfKvfSXQSRH2t3DF/o4IvdKjlxWmI+fo0MTHc jQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug7eabxjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 16:08:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALG85BE029706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 16:08:05 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 21 Nov
 2023 08:08:05 -0800
Message-ID: <268eb900-3231-4d8d-9a6e-c8bc91583d4a@quicinc.com>
Date: Tue, 21 Nov 2023 08:08:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] wifi: ath12k: do not restore ASPM in case of
 single MSI vector
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231121021304.12966-1-quic_kangyang@quicinc.com>
 <20231121021304.12966-7-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231121021304.12966-7-quic_kangyang@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9SaRv9RF2LlGTJx7sKydLWFuN_io3kh6
X-Proofpoint-ORIG-GUID: 9SaRv9RF2LlGTJx7sKydLWFuN_io3kh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_09,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 mlxscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=809 bulkscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_080807_729502_38269B9B 
X-CRM114-Status: GOOD (  11.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/20/2023 6:13 PM, Kang Yang wrote:
> Current code enables ASPM by default, it allows MHI to enter M2 state.
> In case of one MSI vector, system hang is observed if ath12k does MHI
> register reading in this state.
> 
> The workaround here is to prevent MHI from entering M2 state, this can
> be done by disabling ASPM if only one MSI vector is used. When using 32
> vectors ASPM is enabled as before.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
