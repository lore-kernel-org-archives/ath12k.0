Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681EFC41535
	for <ath12k@archiver.kernel.org>; Sat, 16 Dec 2023 19:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9D7SnyIYlGu2ncYy2qku/nv+AUppoYloIuWZx/vYAI=; b=y9lji/5W5Bs3UXbmWIQqC1HDxY
	UeHHUaz7cJP8GkBxhh6A2AxlCkF3XlM87xov3fT9O1cbIIg9sU9wxx2/YkA74AQnHxE9GRIFM2JT5
	kJRzBwxFtjXSq+8CyHOBSWwBOpt6fC9JgpgtEU0nSE/+FM6IRTMK3dmEGzhXPzXk0D7xLCOeL/wMG
	a7jzyyzZ/xpAh8kFX0g98v03YY2/0nSrQKc1fstYksgEDm5QhHQ3AlHjVubteafvc4RKEaQa84nSr
	KYSIgr/9+Ff9NKIVQ+GFd9oczMkDfNulCq+T44Kv4NBQE9IJV7BFJy0kGvRVhvfEp0iGiWHI/7RYj
	hJ0+ZSGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEaD3-006brW-0W
	for ath12k@archiver.kernel.org;
	Sat, 16 Dec 2023 19:20:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEaD0-006bqz-21
	for ath12k@lists.infradead.org;
	Sat, 16 Dec 2023 19:20:23 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BGIpJhD012300;
	Sat, 16 Dec 2023 19:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Q9D7SnyIYlGu2ncYy2qku/nv+AUppoYloIuWZx/vYAI=; b=C9
	USnVR1vjZ6Rk7egu9gMLBZflduSppg76LKzQ1LsEvE9tp0q2hso59s/eA6iq3YaB
	8XavYKa2Vz+zIw4MiFOxVxZk6kCuLjOnZsGOho6ISxYQFMR5DYPDhv/gZ+obxsBb
	ld7FzBWkFrp5Z28elegf5PbOd2iefiBbkT76R1i34lpOsv354UDJPQo9jviyM7xa
	MRMFBow8p3u9WDMeDyn2d1CX0fc9vzomBJjRkRtNDz86dulzspoqBANE5u/nX+bK
	bMa/65Cp+nz0txTn0Zl8CXeLXMsvyglAtjVYdS5dlJl17K47sRQ6hkNKdHjGBVZp
	EKLrxUNWIgFhN3pcl4DA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v151fs2nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 19:20:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BGJKL9u021912
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 19:20:21 GMT
Received: from [10.110.36.237] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 16 Dec
 2023 11:20:20 -0800
Message-ID: <8fab1be0-7ac6-4203-9ebd-975feda862b9@quicinc.com>
Date: Sat, 16 Dec 2023 11:20:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] wifi: ath12k: support default regdb while searching
 board-2.bin for WCN7850
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231216060140.30611-1-quic_bqiang@quicinc.com>
 <20231216060140.30611-6-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231216060140.30611-6-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PEkdUL6--pKxjbPK3Fy5kij10d8dCCqS
X-Proofpoint-ORIG-GUID: PEkdUL6--pKxjbPK3Fy5kij10d8dCCqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=819 lowpriorityscore=0
 adultscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312160148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_112022_674340_44354880 
X-CRM114-Status: UNSURE (   7.62  )
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

On 12/15/2023 10:01 PM, Baochen Qiang wrote:
> Sometimes board-2.bin does not have the regdb data which matches the
> parameters such as vendor, device, subsystem-vendor, subsystem-device
> etc. Add default regdb data with only 'bus=%s' into board-2.bin for
> WCN7850, then ath12k uses 'bus=pci' to search regdb data in board-2.bin
> for WCN7850.
> 
> [   46.114895] ath12k_pci 0000:03:00.0: boot using board name 'bus=pci,vendor=17cb,device=1107,subsystem-vendor=17cb,subsystem-device=3378,qmi-chip-id=2,qmi-board-id=260'
> [   46.118167] ath12k_pci 0000:03:00.0: boot firmware request ath12k/WCN7850/hw2.0/board-2.bin size 380280
> [   46.118173] ath12k_pci 0000:03:00.0: board name
> [   46.118176] ath12k_pci 0000:03:00.0: 00000000: 62 75 73 3d 70 63 69                             bus=pci
> [   46.118179] ath12k_pci 0000:03:00.0: failed to fetch regdb data for bus=pci,vendor=17cb,device=1107,subsystem-vendor=17cb,subsystem-device=3378,qmi-chip-id=2,qmi-board-id=260 from ath12k/WCN7850/hw2.0/board-2.bin
> [   46.118239] ath12k_pci 0000:03:00.0: boot using board name 'bus=pci'
> [   46.119842] ath12k_pci 0000:03:00.0: boot firmware request ath12k/WCN7850/hw2.0/board-2.bin size 380280
> [   46.119847] ath12k_pci 0000:03:00.0: board name
> [   46.119849] ath12k_pci 0000:03:00.0: 00000000: 62 75 73 3d 70 63 69                             bus=pci
> [   46.119852] ath12k_pci 0000:03:00.0: boot found match regdb data for name 'bus=pci'
> [   46.119855] ath12k_pci 0000:03:00.0: boot found regdb data for 'bus=pci'
> [   46.119857] ath12k_pci 0000:03:00.0: fetched regdb
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


