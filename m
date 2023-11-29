Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5080AC4167B
	for <ath12k@archiver.kernel.org>; Wed, 29 Nov 2023 15:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tA+4dm3fGfIdvLepGkvqvZVuTtjmjIe5X9Fmhad0fU=; b=sUuBMZKYtIhCBX5xzmD+5SHOX9
	7EIkEssqoASLIAh5W49jtmbITJOZyZSUTxV3cyA4RychFEVCM9x0zg3nE29FfCufxZmLJhG7RRp19
	lgQU0In0sYANV74HAx4k5XKJCGiww4KAZ7RIBAFazmyYm4QghO5Vu55w2QRvkkNH2xuxxlWNEKgyX
	xl3eRAPTH+ZvBrTjHitNPspSlbSYpAO/YUZVSVCb71a2mnRPE3gkYUvC6jr1QdUi76rpBeGDaoYcR
	Fjq0o5/yiuogl578m3uAqRfWyNopo6v9YtSzb+fiRVLq+JaPkHWZ3X/yHRGVyySjrXTGvoBLpAPoP
	V/A5989g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Maq-008lXd-0F
	for ath12k@archiver.kernel.org;
	Wed, 29 Nov 2023 15:35:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Man-008lX2-1E
	for ath12k@lists.infradead.org;
	Wed, 29 Nov 2023 15:35:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ATDXgnq007345;
	Wed, 29 Nov 2023 15:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6tA+4dm3fGfIdvLepGkvqvZVuTtjmjIe5X9Fmhad0fU=;
 b=dJEKtUHaxDHVTiuSr5pY7A4CkeK5y0LEkXw22wW1ofm8ls7C2tNua7+pEXSpYFeL/R2m
 nJ/xZMtLkCNk6XmySwnA303ZRT2nafw50lE2qVqqpb72zS/cnfsLE/M5Qe+H67AoqKGk
 HeS50/3/vg2sAPlNB2XIZQ7Zro7Vg9G5zZ7wCcGunqsWd7suCMQloJ1EhoEm9PQTxscF
 gxjsa798RLND/e+zAG0ZTSW7WPyT4sdbOH4/U7aiK/0qrJAcC6e2akRx7B4p6B3C7mJA
 pb1zAZSLeidp9V4s5NCWQ1VimP0gL6En9Zn++X60WEG9uiOqw131/wvH75NiS16gRsHS HA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unjdtk9qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 15:35:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ATFZ9ma020239
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 15:35:09 GMT
Received: from [10.110.63.243] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 29 Nov
 2023 07:35:08 -0800
Message-ID: <c1965895-5aa2-49be-a96c-b2aa1d5e5dd3@quicinc.com>
Date: Wed, 29 Nov 2023 07:35:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] wifi: ath12k: fix wrong definitions of
 hal_reo_update_rx_queue
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231129020414.56425-1-quic_bqiang@quicinc.com>
 <20231129020414.56425-2-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231129020414.56425-2-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RRMxLibsPFVIBRp77UwshfylbBiKmfhZ
X-Proofpoint-ORIG-GUID: RRMxLibsPFVIBRp77UwshfylbBiKmfhZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_13,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=551
 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_073513_558749_632E38BF 
X-CRM114-Status: UNSURE (   9.60  )
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

On 11/28/2023 6:04 PM, Baochen Qiang wrote:
> Some fields of hal_reo_update_rx_queue structure are wrongly
> defined, so fix it.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


