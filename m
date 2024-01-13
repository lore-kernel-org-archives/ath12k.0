Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAF0C3DA79
	for <ath12k@archiver.kernel.org>; Sat, 13 Jan 2024 01:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zwo3xPgxETfWvugTHwtecBLkVTqbG7wnc2NQwFCTSLc=; b=FlZyA8G0PESAlkfyCB1uDCRgjo
	BHT7ZOwURkoUXyJBBLyuN5554FQuAxouSr8+5ev+Hp0exwFTaUF8kU6VdvQyZVBrldLx16m3q4FIu
	PRizHDHQtnlMhLD/z3fijxQlfTlwhoD98GfNTHlA5MKHcWMbx3iaC0wzA3wmQzsSr6nCpp1OQZj1O
	4HVxlGsn0wXNFMoDc4hj9mJUzMd8sGBzcK9m5yyoc/Gijb+GYpcXd2HFPk6XboqpfinPhU+ZtkBFU
	eofeKm1vgglQxEqm7Jwme0R2WxoPKxw1hIrqTx/RN2FiQMf4KS1N0XJHilrYGQrzbKNAMMrdIsX2k
	3g9An4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOSqx-004Or5-05
	for ath12k@archiver.kernel.org;
	Sat, 13 Jan 2024 01:30:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOSqu-004Oqd-2L
	for ath12k@lists.infradead.org;
	Sat, 13 Jan 2024 01:30:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40D1TY54011779;
	Sat, 13 Jan 2024 01:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Zwo3xPgxETfWvugTHwtecBLkVTqbG7wnc2NQwFCTSLc=; b=fO
	c+f+b3FyKjqIBNaktIQdkU7ocmV0V4IBxZoOCt9g1guWJpc8rdkdv5KjaAZvoQbf
	AMypsIZkWLVRVWDe+Ltbph/Qv2O1tRjRldmpuvl5GHNk+1G55ZkDfVVKzKezOh13
	IidrC1jJE4rb2SSBYXWTdyYb6CZKfTSpP+VE2qdV82rcmzDGb6DoxoGUnnL28vvt
	BxdlDXQnNsMugel3jo85R7qqh+s1edaqenFyhZeofqpvNaHm5SaCo2V02DQKdXdV
	aIqqoDwy7/BO+Ytb/x0HxhkoBdezv6THHS/MdZcVwNy0FBxwkV2v0Oi4JJJMz3xv
	rebO1Utea4PwlgmmoxAw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjymnak81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jan 2024 01:30:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40D1UMYo006644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jan 2024 01:30:22 GMT
Received: from [10.110.118.97] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 12 Jan
 2024 17:30:21 -0800
Message-ID: <d8664881-dddd-49aa-ad9d-2b4e4612803f@quicinc.com>
Date: Fri, 12 Jan 2024 17:30:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] wifi: ath12k: move peer delete after vdev stop
 of station for WCN7850
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240112092824.7664-1-quic_kangyang@quicinc.com>
 <20240112092824.7664-9-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240112092824.7664-9-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vAF0UFV1EwnZNbsxoTUF2pIRhM4hYe5e
X-Proofpoint-GUID: vAF0UFV1EwnZNbsxoTUF2pIRhM4hYe5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=888 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401130010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_173024_883934_571FB4B9 
X-CRM114-Status: UNSURE (   8.85  )
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
> In current code, when STA/P2P Client connect to AP/P2P GO, the WMI
> command sequence is:
> 
> peer_create->vdev_start->vdev_up
> 
> And sequence of STA/P2P Client disconnect from AP/P2P GO is:
> 
> peer_delete->vdev_down->vdev_stop
> 
> This sequence of disconnect is not opposite of connect. For STA or P2P
> GO, bss peer is not needed by firmware during handling vdev stop
> command. So with this sequence, STA and P2P GO can work normally.
> 
> But for P2P Client, firmware needs bss peer in some functions during
> handling vdev stop command. The opposite sequence of disconnect should
> be:
> 
> vdev_down->vdev_stop->peer_delete
> 
> So change the sequence of disconnect as above opposite sequence for
> WCN7850.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



