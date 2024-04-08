Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E93CD1297
	for <ath12k@archiver.kernel.org>; Mon,  8 Apr 2024 22:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ge1a1RUicUKVwlP7aTZXkx/xiVpMFuGvFfxzp6eETdk=; b=XsqBD7FkwC4sEiI4+ZWWKN6BbW
	jzW+WkuympILa43IMNg4dW4V3FOFpD+5QvDQ6iobiSFMWcKlHNthpHi4Ej8RXwQirkkXbnrhrwnFV
	cgqW0Cyl2ICW/W657bepZeiwPd2F01fKkhItwzDRq0HeMcCm1NwZM+9VU42tmxdEsInY5Zm8RI4/Q
	+lRzZYzoI5WvN+AgYDRKq0lqSeDh3/+pqCvmz/z7m69aFhkwpIxZlmmX59PsdVoDdYLS55kUhlzo8
	TNdqn1m9oHn/1YzjJiJlgz/32OP47g8/xXvccxCtcolVw2DETvzMKU9wD+6EIuk6RAGFHR0Uilv62
	xsxyzgcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtxIw-0000000H0H1-2BXx
	for ath12k@archiver.kernel.org;
	Mon, 08 Apr 2024 22:17:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtxIt-0000000H0Eo-2wwL
	for ath12k@lists.infradead.org;
	Mon, 08 Apr 2024 22:17:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 438M9xhT003684;
	Mon, 8 Apr 2024 22:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ge1a1RUicUKVwlP7aTZXkx/xiVpMFuGvFfxzp6eETdk=; b=Wh
	mex3t6w+kYbzTKx68I1xGQ4e1WJIqGUrS6VxHAzxDyGe0j7S7XfyWHKxihAVnbuH
	ZfC7foHDQYO1cXSmIIXJBC9IM/lBOdVUWOpJZIhm1dDw668RsQRLjmG6ohGiBxIK
	HjxNaM6k5z/uSXuGNjlkF9VRAjXBbU51agrXxMuZwNXibmW12OPmOqMBaiEK9hu9
	hq77f1Z0SkJKSIyrivlwlvV9+SMbsk9BgOQSRvLDiMuDlipJWNr6fRHChnf4DdCW
	Mn15d6RrHvWYM2N4ShDWFUgTuWR8eibwQMf8PQUGafC3lwQhxCNAiKMORvYuUS44
	JFuuZNS3WOEUYWOHf/cA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xcbfyhyn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 22:17:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 438MHQFq027107
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Apr 2024 22:17:26 GMT
Received: from [10.110.80.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Apr 2024
 15:17:26 -0700
Message-ID: <7c57c1f4-13ab-4216-9283-3290fca44a83@quicinc.com>
Date: Mon, 8 Apr 2024 15:17:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] wifi: ath12k: Refactor the hardware cookie conversion
 init
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240408040547.837639-1-quic_periyasa@quicinc.com>
 <20240408040547.837639-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240408040547.837639-3-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rcq5TURkOjAqYgjozOwfRACLvUg_jAwY
X-Proofpoint-GUID: rcq5TURkOjAqYgjozOwfRACLvUg_jAwY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_17,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 mlxlogscore=992
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_151727_790987_AC435AE8 
X-CRM114-Status: UNSURE (   8.37  )
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

On 4/7/2024 9:05 PM, Karthikeyan Periyasamy wrote:
> Currently, the Rx descriptor is placed before the Tx descriptor in the
> primary page table of the hardware cookie conversion configuration. The
> Tx and Rx descriptor offsets are implicitly hardcoded. To allow for easy
> displacement of Tx and Rx descriptors, introduce Tx and Rx offset based
> cookie conversion initializationi. Additionally, should consider
> validating the respective offset ranges while retrieving the Tx and Rx
> descriptors. This change will be utilize by the next patch in the series.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


