Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E96C001DF
	for <ath12k@archiver.kernel.org>; Wed,  2 Aug 2023 08:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gwxotosSoCH/UdUzTIx+GnvmHN9XOPoUNh5HBfuljtc=; b=gR4RY0v4pA+fYE
	YgR7aMd8467DASb+5BQK+ci+V6nRIJkbSpSQ2eV5Vn6x96iE9gb9X1eIRFp0LLeFBxYpFM7UpMNp0
	IqV0Jpu/vqYVQvQSFtDbPd0gK9I08Gd6dAYojjesvCtRD3n+gZ7Vd74YMEqyvemmhozBil/h38dmV
	FH4zl+rtay3xWl+HMUsh1E+yUslPyKHtXHkfntABrgwCtyiqjM49XBcYXWbP71r81Ueh8363TL0qZ
	YxJAt3L9S13292hwiw9oeuo12JTeN0gGHI99YKwvwpCabcMoQNFrZMg+CSUJar2U/60ivK+MY+MFs
	w7J0VGZgKT74TOB5I4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR7i1-004QhO-17
	for ath12k@archiver.kernel.org;
	Wed, 02 Aug 2023 08:59:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR7hz-004QfL-0p
	for ath12k@lists.infradead.org;
	Wed, 02 Aug 2023 08:59:56 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37268oGd010953;
	Wed, 2 Aug 2023 08:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=c1nkLHFd+NlF61YfhQ476mA/iKW5+Fzefk0vDdVgbPg=;
 b=EQn2Hdl6rvjB5paAV+1ZN0FpXyeZDo2Sp/K3jQUb7+Vx+up3praoQszOe1OFNFGJVXEs
 EOUvaooQTozXrKeGZ4aukmbO+DYFZOPPRuc9mnU5MzW2qQNCf3PUMHYnD2FvrtGkq8DQ
 MOdKLj/GPtWbCS1+8gU3otSF+cEScobn2C/2IdQg4NBKMp8Z7gx+9YuhmR30RfTF+48o
 0lJx94nrgtAeTbJy8S4IJ9TLxB8Y8jPKaUxpsa3BnuN85OAsWPnZt+j+NMOj+MXK+Um3
 +1rR6xEtSs9ij7E+sIwd1jcwdmsOskBS4riOyxUP6O4KeoaR4yOzsdPSGD/aBtCZNg9y Mw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s7fre0tmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 08:59:43 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3728xgwP012145
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Aug 2023 08:59:42 GMT
Received: from mdharane-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 2 Aug 2023 01:59:40 -0700
From: Manish Dharanenthiran <quic_mdharane@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Manish Dharanenthiran
	<quic_mdharane@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: fix radar detection in secondary 80 MHz
Date: Wed, 2 Aug 2023 14:28:50 +0530
Message-ID: <20230802085852.19821-1-quic_mdharane@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: K5pKn2_U_PoqHOEOnOKH2qVowGx-EoqR
X-Proofpoint-ORIG-GUID: K5pKn2_U_PoqHOEOnOKH2qVowGx-EoqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_03,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1011
 mlxlogscore=571 bulkscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308020079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_015955_426654_A43DC112 
X-CRM114-Status: GOOD (  11.87  )
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

This patch series add fix for radar detection in secondary 80 MHz when the
AP's primary 80MHz is in non-DFS region in 160 MHz. Also, adds changes for
fixing WARN_ON in ath12k_mac_update_vif_chan.

Manish Dharanenthiran (2):
  wifi: ath12k: fix WARN_ON during ath12k_mac_update_vif_chan
  wifi: ath12k: fix radar detection in 160 MHz

 drivers/net/wireless/ath/ath12k/mac.c | 47 +++++++++++++++++++--------
 1 file changed, 33 insertions(+), 14 deletions(-)


base-commit: dfa8dc118e3cef402d4fbc2ae9cab418197d103b
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
