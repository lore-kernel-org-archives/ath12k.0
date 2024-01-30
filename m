Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12104C46CD2
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 17:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYPPWXiABdAj+PgG9xeGAkqr+SENGa2JRLJnAoPRxzw=; b=G2hCZc/5xYuviaA5lYDvgCXbjd
	pgTs0N0+gJZtxf/Cbk9Z4GRZxLZpfnUYSZlYgww97J3QbzkI35RWowNv3YT5w1eGxqw3yIW9kYa4J
	Ns1JqAviHxIPjom68KJlg32fEoeHD1Rl0X7Uu8Pp/Lvmp6JValqDF7HPyI/niuuLEJ2YnqP7njzM2
	r2T7GOJVzeXWsg8cxkJtuklBeF46nh5MxysOoPGsinLjQLNtX03lMT4cN3Y7Bk9ZCVUIRjnV1Uc0Z
	mCYCxLTUwCmLAq2gZEJ9dDxZi/Ab10BBXpkkA9wBds2IumzxBXTKOWXbrybo98zoyiuwJj1SQ1r3g
	tMHHYSLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrrL-0000000HYTd-3FLX
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 17:25:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrrK-0000000HYTL-00HA
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 17:25:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40UGsDVn007663;
	Tue, 30 Jan 2024 17:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=CYPPWXiABdAj+PgG9xeGAkqr+SENGa2JRLJnAoPRxzw=; b=Iu
	23aobC9o8RxsKE+1FWjC0YQYVU/he/vKcYGBTCuDkfZrSDNdotWOIkRe1AWRfoqC
	iotAcYlcgPyV+OzhRUTfsILHf+bd7yIswct0iiJvgyXflsWsmhSSYSJmj1LB32zh
	/ZkvpKqfn4Kcdv3aQkg+BpKe4Rdwl1xrfVkzHrgCcyoHoazzsrI9MyI81zU9L7S9
	j1O1xVowHcP7gs17AOIjaPy3QDRW0w5nB9uTCFIdp8+TL6yOcuaoOuZcrisp8Ixl
	4Hbh4flZwl4QvqRpYDwXlto5bMRqXvxMuZtmuMWgn5jhHsZNwTBG17FXuT7Sqfj4
	T5m7dVY/YuToSTEOJeTA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vy51p826r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 17:25:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40UHPH2V022187
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 17:25:17 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 30 Jan
 2024 09:25:16 -0800
Message-ID: <0cd188ca-18e4-4e10-a7fb-341e3f098106@quicinc.com>
Date: Tue, 30 Jan 2024 09:25:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/11] wifi: ath12k: advertise P2P dev support for
 WCN7850
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
 <20240130040303.370590-12-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240130040303.370590-12-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xFBlL2_wTlPIV5p7NYUkfwPfJy6iWzaR
X-Proofpoint-ORIG-GUID: xFBlL2_wTlPIV5p7NYUkfwPfJy6iWzaR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_08,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=516
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401300129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_092518_080548_19F5B02F 
X-CRM114-Status: UNSURE (   6.75  )
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

On 1/29/2024 8:03 PM, Kang Yang wrote:
> Now that all the necessary pieces are implemented we can enable P2P
> support for WCN7850.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


