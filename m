Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5308FC83F34
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 17:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rvDDOwlAfh07/HCzM7218UDU9HsLIY6jh5Nb5g1s6DA=; b=Y+28rZW/Kw3hY6L+ag5Em0ICTR
	QSCS72wUu7Mu7nJ9KB+EhAnlM+joIhu5pNqCmZ/t9EoJV/xEaHqewYzHs+9nf2qgtUKziMolEt0tK
	C+EikXWoWeF/k2KM559ayesjKy/KDM9xn7eH8zdzZLuM8SnZzlZ1jNWLQsiKNcBrz3gcIgZd78fqr
	kgnQSDM/qysve81aClhWs+4B7DF0iL7tUf2FQ2HiNYojZcle62HJecc9qzkhPs3/L5PQrHTOGmTDV
	O5FIkPMTEDfMTvT+GWz1uh5IZ32rs6EZnaOf7k86zuYi6nxbjMQBiL3MF5GzhPCuZxCGaWeqQr9XH
	w87jojfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSZB-0000000Aoxz-0C5p;
	Thu, 17 Jul 2025 17:38:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSWP-0000000AoR1-1BOM
	for ath12k@lists.infradead.org;
	Thu, 17 Jul 2025 17:35:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HBk1GJ022239;
	Thu, 17 Jul 2025 17:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rvDDOwlAfh07/HCzM7218UDU9HsLIY6jh5N
	b5g1s6DA=; b=OYJUE1rYvAnZTgLRhcnCQoUu87EPXRLwJWrqRgxflEn7X4L5xGl
	x3HYv2+Zh/96jdVmX0z8r0hFry8VigLVKjpYPb561HMnGwVvR2bFqNPyvTbpwNqG
	UsgTu0DeXsb658/Lb81asHG0tmpYo8x85bcChyRbvn+F+lms9DGw27qHLoaCP4RW
	gQJM2HAXhxtiO1CYNahahDkQSRspd9fBGMMSFPK+tNQj5qsVsYgIgmaFbVw77Wkj
	pTZQghatholywurQk/o2uJ1hXjnusb2a99vzQZu1IvYZO9oOs7izuiNgWDliyIb0
	abSHZoHOQAAUj23LscPesV5xp/7wTZ+Fulw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy8mxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 17:35:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56HHZmoU004189;
	Thu, 17 Jul 2025 17:35:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47xuvs3b98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 17:35:48 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56HHZlFg004184;
	Thu, 17 Jul 2025 17:35:47 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-tamizhr-blr.qualcomm.com [10.190.110.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 56HHZlT5004183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 17:35:47 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 380741)
	id 29DC741566; Thu, 17 Jul 2025 23:05:47 +0530 (+0530)
From: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: Extend support to parse wmi service bit 
Date: Thu, 17 Jul 2025 23:05:37 +0530
Message-Id: <20250717173539.2523396-1-tamizh.raja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE1NSBTYWx0ZWRfX5IDFy361Kxpn
 FY0e6GoHMCPn6TJXsicnvtMJBkCLIahYR/+Su5Tg7v/jDn7CQ86qmyVAD+LqomC0vdZ0uT4wBwd
 l2XhXXnxXsuX10BGtzZ/kRdDtHyvAhOo6/emqVB/Sc7GYn+L4M1uREn67IsktYCRWL7Ic2gq+W3
 OE6Tg/1W1LaXBEF5nCPH78oB0qZdLqLnS+EKTpNsmWyUG6Bvlti8qy+Gmy3nCHYBYSQBZaIq7dw
 X55V7sjQ/xinUldrT3Vzo589YHNESRJIpjNrzwqpSj+mOJ1JazLaYfIdXsNU4W4nehtqEyFZLPR
 7pDuNAmDWv0Hm/DDew+MBopsIt9jorjrbaTTGc92S5N6pq8NSvQauCvX+EF8Ehttl9+aLiybUJK
 kxARn1WYz+7ieqKRQ2RHQm28Z0u1UyvWpB3kqvGtYm7HtjW4Hh3IuqRdysKuDW7H4mbyZFD/
X-Proofpoint-GUID: vG4BRdLFVwxMQbD9IbsA0oGa9rw_hioa
X-Proofpoint-ORIG-GUID: vG4BRdLFVwxMQbD9IbsA0oGa9rw_hioa
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=68793478 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=VqKXJ2bPb1k_lhZ8nysA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_103553_326158_A37919BC 
X-CRM114-Status: UNSURE (   6.04  )
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

Extend support to parse wmi service bit till the last value firmware
is advertising and use endian conversion while accessing the
wmi_ext2_service_bitmap value in ath12k_wmi_tlv_services_parser().

Tamizh Chelvam Raja (2):
  wifi: ath12k: fix endianness handling while accessing wmi service bit
  wifi: ath12k: Add support to parse max ext2 wmi service bit

 v2:
   * Modified commit log as per review comments.

 drivers/net/wireless/ath/ath12k/wmi.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)


base-commit: 65c12b104cb942d588a1a093acc4537fb3d3b129
-- 
2.34.1


