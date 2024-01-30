Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7379AC46CD2
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 17:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0dBUJdr/gkAbZDnoxlz/C1JUW2fjuwJk7SMDzlUC+g=; b=OIDCH/XQtv7j8f3kKhv4sETQoF
	Fyx+mBwb9KB2uSgCnUjByv1Vx9tb1GN/I0nnZmodg9ysfmfaSAoUpm3qVNbZNJaM7pF0c0MUZcvvI
	AHW7IJD8dGBT/pAkeLmCFRQVSnl+CprKRdQvTCaRLywL4BFc7iQEJgL8qnmtRMG7ssfA0HFoOZLjU
	FyaV7z9H9qzlC7DwY6jJkhqergWYOXmPi2dykSrYJGJooG7mc77J4R/wVhZhVCXt+H5K95BoNEpHB
	QvDW4S8VIea+yrMFIh+fb6EC+IqiLiCZLAL5Uika9ct3njGqWDjvqFkrn3wUyLvpRKIg7MU8vo7Uk
	kATMTCXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrlN-0000000HX97-0gUS
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 17:19:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrlL-0000000HX8m-0koK
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 17:19:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40UEEh1K022856;
	Tue, 30 Jan 2024 17:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=N0dBUJdr/gkAbZDnoxlz/C1JUW2fjuwJk7SMDzlUC+g=; b=f9
	lpICobsSL1opP8SbwbHP0kN1s7v4jkJFPM9KHfAg6g/qC8EpLO2+NdvB0Ee629H+
	o8Whc2iUHk8D+EYiLZi10FiJmGDGneikrUK7jEhN1jd3KNqZ119NcwN5CrJI6PXw
	N23/x1afcQ2vVj4fpody70quFDj4AWkDSR1CQg2p0obA9K17IUYGc7oasEILkOzH
	vhctDUVwzCARD+lGcxzxmG9eZ8x8UjRctoq7tf6Se1y4lLkfJV69hN2R4Avl7/Tq
	cV68WLIS9XAnkwYKW28p27128DhalTVOje8/6yQTTLNLm0vfAsr2Yz/D2eMr+Uw2
	K7TAPMMn7BN3KDVR7yHg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxtp31key-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 17:19:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40UHJ4x8013815
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 17:19:04 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 30 Jan
 2024 09:19:04 -0800
Message-ID: <954b9ad2-be0d-4421-b20f-5b3e48dd673a@quicinc.com>
Date: Tue, 30 Jan 2024 09:19:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/11] wifi: ath12k: change WLAN_SCAN_PARAMS_MAX_IE_LEN
 from 256 to 512
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
 <20240130040303.370590-8-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240130040303.370590-8-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: F5A3yNb8h44Rk8hfgHaaV_j9guc5OOqZ
X-Proofpoint-GUID: F5A3yNb8h44Rk8hfgHaaV_j9guc5OOqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_07,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 mlxlogscore=849 malwarescore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_091907_374390_14A95BA6 
X-CRM114-Status: UNSURE (   7.83  )
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

On 1/29/2024 8:02 PM, Kang Yang wrote:
> Mac80211 needs more space for P2P scan ie in P2P mode, 256 is not
> enough, resize it to 512.
> 
> Also delete the duplicate macro definitions in wmi.h.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


