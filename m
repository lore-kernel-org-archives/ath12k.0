Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0267ECCD184
	for <ath12k@archiver.kernel.org>; Thu,  9 Oct 2025 21:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xUWZDQzLZsCVvhUanKwQxXc+w/D6CQx/9IWXS2PFdxI=; b=vxqi4/M24BYU0NXEJQEfQ9CeUJ
	XQqXWxyGhQ9QMSG1LaeNrKxdz8q60+2dqTwzZN/2EohZf2aSrRZt9VTM1vEjgkFrwW4sOZArnVR8K
	ukcgAJwkz8cxOIydhN3Nc1CHzJQx8pu1asbdWjwd/VzssfSpJLywINswWbIWd5FvM5riR94DepX5Z
	sYxs4QKhRt1tojF/le5/NuiM6et1RrOeIeGM3FMe0jueya3+NoexBBIIQxthGznpJrNjC1r2ggE9/
	ysN/iyZ2UGdC6vfr/4W0egWAyMhCBrZUuUlDxuFP9KhRKfnb/9/kFGUrA7+vtFUKGA9dH8h9T+Q87
	Mud6wrVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6y0h-000000078Pq-3D2a;
	Thu, 09 Oct 2025 21:17:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6y0e-000000078OH-2T2b
	for ath12k@lists.infradead.org;
	Thu, 09 Oct 2025 21:17:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EeR9P029031;
	Thu, 9 Oct 2025 21:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xUWZDQzLZsCVvhUanKwQxX
	c+w/D6CQx/9IWXS2PFdxI=; b=QuenW8jITSWjKPTmSewxzkUZXgGTZiSOG2cxeo
	R1PKnmOMxz0MShRNa1WVtvYoYzsBsKgWv66tL3xLraoApLsLspTBnVBPs1JTj9qM
	KrOSA7vJ4ssd5kwM2PR8pVhWkGl6AFLcCybfpn0+/MAdE0ZmFmU2bNvrvIaRN1yL
	lFQ0ajUgHj1lM+J8kcIA3LZJFOJ+ORaoW6srz1h/3TQ9YzgP1Yn+lgTxxeCtAmRb
	QLav3i9Q1d15wAUdUJ/5ZOo/w+rUW6lvEjd9DuuRgji7Gh8ZrQ3pMzXBUya1Wl0b
	PWygOZD2CXhZWpnqvyf/0kf8DUAiBZh52rrakLl4ors5LM5A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kvb9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 21:17:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 599LHAae000375
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Oct 2025 21:17:10 GMT
Received: from ath12k-linux2.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 9 Oct 2025 14:17:07 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Subject: [PATCH ath-next V17 0/2] wifi: ath12k: fix TX and RX MCS configurations in VHT and HE modes
Date: Thu, 9 Oct 2025 14:16:54 -0700
Message-ID: <20251009211656.2386085-1-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXxX5sFjyJ3VUx
 RlI09i/eZs9u497IW98JpwNeJv3kJiwIPstcYASiD38HwtaeyxolRVI8MIRStHU61aEzOVMYZZw
 nc0jrWfFiNzdwcdvyYF1yR4b5q/4WIvA7LqpmoLbdCx8vU+Slx71OOPKvcITnPxNMqA+GMvlVDw
 0VlhmePuGZBma/bha92AxHdcpeUh0IgbZbp8TC+1MW98clmR1k9m91SHweLKO2CEwQQDsO2vKc0
 DXC5HuRtsoB52ARhLrXPEqLNTG8FAiEAFxNaPoslB2ki683sj96ZxNuNu9IUKYJkeB2ok3Jm0FY
 tDH7M5FDwm6Ww+x7DxM/G1cNM+4oRyT7QF043WppehwtjApP4YyUUgPMMpg8NL8LJGt7twbvAB4
 z2mmEA3GcaYOAki91ZOVBDYEBXBr3A==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e82657 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=LuIi66ol2zLzsDA9yAAA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pBz_DdcMcIzSQZ9c_bY3oajpa_QJOmEE
X-Proofpoint-ORIG-GUID: pBz_DdcMcIzSQZ9c_bY3oajpa_QJOmEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_141712_637326_52748B77 
X-CRM114-Status: UNSURE (   8.36  )
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

This is revision version for patch:
https://patchwork.kernel.org/project/linux-wireless/patch/20250701010408.1257201-6-quic_pradeepc@quicinc.com/

changes in v17:
 - fix spelling in description.
 - change wmi.c wmi.h copy right per guidelines.
 - fix missing recalculation of v for TX MCS 160 in patch 2/2.

changes in v16:
 - remove patches in series which hare accepted already
   https://patchwork.kernel.org/project/linux-wireless/list/?series=977538&state=*
 - Fix review comment on last revision https://patchwork.kernel.org/project/linux-wireless/patch/20250701010408.1257201-6-quic_pradeepc@quicinc.com/
 - Add similar VHT related changes into separate patch.

Baochen Qiang (1):
  wifi: ath12k: fix VHT MCS assignment

Pradeep Kumar Chitrapu (1):
  wifi: ath12k: fix TX and RX MCS rate configurations in HE mode

 drivers/net/wireless/ath/ath12k/mac.c | 12 +++++-------
 drivers/net/wireless/ath/ath12k/wmi.c | 11 +++++++----
 drivers/net/wireless/ath/ath12k/wmi.h |  2 ++
 3 files changed, 14 insertions(+), 11 deletions(-)


base-commit: 94aced6ed9e2630bae0b5631e384a5302c4b6783
-- 
2.43.0


