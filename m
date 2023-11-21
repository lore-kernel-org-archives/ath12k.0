Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17459C61D90
	for <ath12k@archiver.kernel.org>; Tue, 21 Nov 2023 16:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOUrR0/vbnLYTeG93qbmmR0vUE1oLSopirQYul8Bvyw=; b=PrMIX/pi+p1CgX
	9ZGdEAr5yLKJw+aaWph8h1qi2dlY7wzfGnBYdq2zP2TOOZ1t2KeEXLJXJKKWxoRhum2bDhKuMeQ+y
	iydgTlEC8Lhav3pnZTaTQIkTVxMofw+eELP3za/zHNoSAtxSp6FUfXu7o+E3aObkhyLSlcFLAwv8K
	Pakpw3itRPVuzEn+AOZQTz9h0CLtvQPt58GQRTqJ9b6Gq76j5/z1NQuN8XthRkY9KEyfZNq1TQG42
	1dkIkrm4Wd1WTW46WjNVbrIS7KRBOAm6K0aPKzLj9Kugu7shaD/xASJjdtKpsCdQkw6UHlWDCVIQl
	8TKUZscXsSaAYGPA7RFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5THd-00HF7L-2i
	for ath12k@archiver.kernel.org;
	Tue, 21 Nov 2023 16:07:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5THb-00HF6s-1l
	for ath12k@lists.infradead.org;
	Tue, 21 Nov 2023 16:07:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ALFehle009665;
	Tue, 21 Nov 2023 16:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=zGSc3K2GNHW2ncC8kG3ebQzWPIOLxZrWk1V2IT3ZOo4=;
 b=WpkvaVOnhi3N5o2xq45WQlNwCq7Ck8SYQSOSeCq6xvc411b5la2pFFFC7HMfoKMmAc/b
 3Z5TKUOZtK8Imvd579eKQBfas7CIPWrIZ6GcH77ajthUtZjnnzVO8JiDOCkt6rwlBFzG
 29p9k9IqMDtqVlxd83IB5URtL6jDuayVbONZLy44H+sUqwuEwj4o8L9pM/ppBUaJ7ron
 zzPYg2ZrdD7vTTQ84xI3UHI3YR0rMA2BPabgEtGs+m2XYCuy615CMfl+umdSHPvFs51H
 vg/iK14n+3rPPfKFVWZW78bhsgn+6lSCDv/B2PKsXTVzR+l7+iM7rLdrBXhvIpTfvEbq xg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uguwxrw99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 16:07:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALG7Q0Z002416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 16:07:26 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 21 Nov
 2023 08:07:26 -0800
Message-ID: <ad0023f5-e7f7-4489-a280-4c5b5ac357f2@quicinc.com>
Date: Tue, 21 Nov 2023 08:07:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] wifi: ath12k: refactor multiple MSI vector
 implementation
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231121021304.12966-1-quic_kangyang@quicinc.com>
 <20231121021304.12966-5-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231121021304.12966-5-quic_kangyang@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yEAjbSafId3OMTiMD1MbO51js6h8zzm5
X-Proofpoint-ORIG-GUID: yEAjbSafId3OMTiMD1MbO51js6h8zzm5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_09,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=723 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_080727_592200_36165BF5 
X-CRM114-Status: UNSURE (   8.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/20/2023 6:13 PM, Kang Yang wrote:
> This is to prepare for one MSI vector support. IRQ enable and disable
> of CE and DP are done only in case of multiple MSI vectors.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
