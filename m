Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1C8C3DA79
	for <ath12k@archiver.kernel.org>; Sat, 13 Jan 2024 01:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1SWi4lB2J7rRsv9+QtLVh2rDMIlYsdu8OWHCfHteis=; b=UPBvx4Hf9cS0l0Nqx46XFftcBf
	kb3k8t+raDppBLvIVA7LytGR89XQvpL68tYElQb9Pe2Hx3lMWPA4Pv1WChmOUigL6j4rks4Bg6oh7
	CmZ9WL0pZUDVNJjyZpGSMExzEplsJ2FEfQD/74t7fu+ZAGMYb0B1/ZRuhZtWAdzo4e8kJj+TFe2H/
	6kg/1esrIGqgGXXuJdw2elwVoOiXDK9Jkj6KZss97mAFlZ2d5KJUDasaEyWHLVKP67sSiBW1dPNg5
	radeinoDBqAe/mWM02vWhVS3cIHNgoE47nT4DhUZYs5J+UiGrxPRgtaKucJJw1aLAo1dx3UY/+b7w
	bPWCU0gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOSs7-004Ow9-11
	for ath12k@archiver.kernel.org;
	Sat, 13 Jan 2024 01:31:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOSs3-004Ovq-20
	for ath12k@lists.infradead.org;
	Sat, 13 Jan 2024 01:31:37 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40D1O9Qx011857;
	Sat, 13 Jan 2024 01:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=M1SWi4lB2J7rRsv9+QtLVh2rDMIlYsdu8OWHCfHteis=; b=gG
	I4iCieesRCVKZ+CJ7yjxPKKvEXPlDYKWzX4wpl5BHeL6U5wtyEL+M7Y8zNnQgjBx
	jNcpAT0pyJidShtuVPoi8qHGO6rUZGLlCFuVlGmUaeS94K+QjcrlxhGvpmL8l0gg
	ItzT9PFlIS1FmCeu3qUA6dpopiqmNyp8FNsFU4UTSlDRml6kQpeibziFMlzos5aJ
	nRXN/qgkBaHp//+EqRdtyg6PgfDa2q2AUZubOPfgEdI6skXiIszUwRi4r0ddrlrf
	phOjihD2fZXA3NDUsFVVwk9Hu3hTfNX4IcRq7QGLOCYGCUHNc7fioYTVWb/SiCKZ
	RcYgSl2eGhfPhAVh4jsw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vk1x1a69u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jan 2024 01:31:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40D1VY32008818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jan 2024 01:31:34 GMT
Received: from [10.110.118.97] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 12 Jan
 2024 17:31:33 -0800
Message-ID: <2e0e94d9-8519-46e9-9896-dabb79083e5b@quicinc.com>
Date: Fri, 12 Jan 2024 17:31:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] wifi: ath12k: designating channel frequency for
 ROC scan
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240112092824.7664-1-quic_kangyang@quicinc.com>
 <20240112092824.7664-10-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240112092824.7664-10-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aUDg5IWIl3IdEw1le9OjUxVxP4Ys1jZl
X-Proofpoint-GUID: aUDg5IWIl3IdEw1le9OjUxVxP4Ys1jZl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=857 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401130009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_173135_667487_0627806E 
X-CRM114-Status: UNSURE (   8.80  )
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

On 1/12/2024 1:28 AM, Kang Yang wrote:
> For P2P mode, the WLAN interface may be requested to remain on a
> specific channel and then to send some management frames on that
> channel. Now chananel frequency of wmi_mgmt_send_cmd is set as 0. As
> a result, firmware may choose a default but wrong channel.
> 
> Fix it by assigning chanfreq field with the ROC channel frequency.
> 
> This change only applies to WCN7850, other chips are not affected.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


