Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A786EE7C4EC
	for <ath12k@archiver.kernel.org>; Wed,  4 Oct 2023 18:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XpizKUwdY32XGR9+sjn2FKM8eLqW/+u2Nj3LwowakGU=; b=tFq2q4QBH1OtS9
	WQ3axjCBJ0KRRKtmsS6q9jmdpK9/AlvIq47balETuCUW4n5GaMrV+RmMEeD3VsFik2w4ZC4YePeGg
	hNLNtsGXx0SOrKROunVelGtGKfmjM/Q1p+k+31oswuOBhB0cNlxkFIJEmh7RPcL3Bz67ZoH5NUkQ6
	UQ8/MKipG4b4fF6Gq2SlKnlIBNjJ8o71Fm6t7LMy2Yy8ML+SFBL/Uh+k6xkpcztReVgJFyaAudRd7
	g8FRElI7pSzY8PrkY7rB5zBc7VrQI+ZhfYZZddf3XKnEb4eCEew1ufBDcBGNAX7Qx4HVJAaaUtzCh
	Q02vKUNj/BGo5C08lxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo6sc-000itV-1J
	for ath12k@archiver.kernel.org;
	Wed, 04 Oct 2023 18:45:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo6sX-000it1-2n
	for ath12k@lists.infradead.org;
	Wed, 04 Oct 2023 18:45:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 394GjCMU003230;
	Wed, 4 Oct 2023 18:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GurH8bKL+CTciNVyLikBgLu6gh2boLCkwEgQL80rfZE=;
 b=GnlFnFdvHb72YSp/zezQMclQUopvXy/BHRFK33qmv1ESdPm+cB/juOAvaj/rV/rxaVPv
 8iVtTHzgc4bqrfTV97v4+lLSferIB+Ls/Hw2PQPQKs2RLebhx1b6r1F9fimlMFO6gp7F
 +2xvw6i1kblhL9Aobuwc+EA3bC9p+qNeiiRNQWKIhbFligZkfkhEZ+r9GhKHs6Sga+xb
 Q4Ami6TxFuRPx7QVhbVRnR8hFbIpw8lqX6mU4OovJydVDuvdzPa7eQPi6Iszf22O5wXY
 S4g+xFvp/xxdMOoVo46rRL9cQoRYBQYG8u6SDYgprTCTNRqYltEodUUWNJXDjQQI0JiU kA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3th2gq1tux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 18:45:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 394IjmOW001987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Oct 2023 18:45:48 GMT
Received: from [10.111.179.185] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 4 Oct
 2023 11:45:47 -0700
Message-ID: <75d04fcf-b800-4c8f-849f-ddc655462a97@quicinc.com>
Date: Wed, 4 Oct 2023 11:45:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: add parsing of phy bitmap for reg rules
Content-Language: en-US
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231004092818.25130-1-quic_adisi@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231004092818.25130-1-quic_adisi@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vhZvmiKeP97rWZD97mPeAQGjr1dNXJiu
X-Proofpoint-ORIG-GUID: vhZvmiKeP97rWZD97mPeAQGjr1dNXJiu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_10,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310040137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_114549_907974_DB6DD933 
X-CRM114-Status: GOOD (  13.08  )
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

On 10/4/2023 2:28 AM, Aditya Kumar Singh wrote:
> Certain regulatory domains could put restrictions on phy mode operation.
> For example, in a few countries HE/EHT Operation is not allowed. For such
> countries, firmware indicates this via phy bitmap in each reg rule.
> 
> Currently, there is no logic to parse this info and then pass it on to the
> cfg80211/regulatory.
> 
> Add parsing of this phy bitmap from the regulatory channel change event and
> then accordingly map it to cfg80211/regulatory flags and pass it on to it.
> 
> While at it, correct typo in debug print: s/dsf/dfs.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
