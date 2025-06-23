Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F67C7115B
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 18:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCgXSZ3a7Z3VMqyz622ohXltuI5TgPBPLHRciyIHeVU=; b=RsddsB5c6bOnwSLO2RpSg8Hls5
	l2PK93Einmsxe/ySRP2KL7K/Kb47rbA8KcqtDZcbYh4uWcLa4VPOKwVWTH0s4TGLUYghT23paPeAO
	l8g3I+s3Yq2satmZUGcteyKjPx0BdrOUSBgD9CYZ2g8PJ6jGyUikVovhPkLa1idaH0ReNfZy+JN3l
	irc6ZTboBgCf9NKJTaCsa/kXm/WQ4BJHammuH0TIeUxa+bfUeGLyJFV7wtJoU0gKsYtRtRj1ZnYOG
	Ye9zarIpGilNeI4uzDcjqlPlwBZYuSy2mPWIyZvJ7ksAuLMMGYBVu37HKq3g9Y+E/qsQQf+C3AVbo
	FCJ9D5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlzi-00000003hEq-02A2;
	Mon, 23 Jun 2025 18:34:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiTX-000000036xj-2x5b
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 14:48:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9TfFe021069
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCgXSZ3a7Z3VMqyz622ohXltuI5TgPBPLHRciyIHeVU=; b=aY8alQPv0KeECGAF
	4Fv5+Hegg8s6H/0czZlVchP9Jwf2khowlOGYjTpdUj8YPDSLAzzPIxs39K6BZh2d
	cRbKzYv31ncCD61eXGA3hJAnr77fd2aUR9zKACUj9WGNjjHRs3og9KUMztBkvp63
	mUY/fjVYmip1EeMVPpXV7A3GT2l3YZSqZNEjmccej/yrMV3WsjveKV1jSgQlftOi
	Y6q4S+FX8+DT/E4j/2P16UeboED7Fiq70zRz9lRWR13SEluhtEkHtN7Djtfy4IHp
	D3TK0Mo/XSRz3HBLVdPJyYGSZflK20Pvwz69sM6K/iNw4GwBp90ncX50tnZ4VdZY
	HF98zA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3rvwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7394772635dso3200985b3a.0
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 07:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690126; x=1751294926;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCgXSZ3a7Z3VMqyz622ohXltuI5TgPBPLHRciyIHeVU=;
        b=ApAAuDhL6/XUdo9K2Vmz0PWPbt/Tve+0Uk3jafh22EK2GBBGV6LV336e97dnMqofw2
         t4c1YIzdPo+aj3ME4NEye/0htwUlwddK2kBrGsBa/qU/xLrs8zmdJjVAKL/9E6uBiYzq
         2VSBWGx3QLUO9AcG871HZF1U7ayDr1vC3ELXdv1qMV7ocEBtVRDzigrehsjS7kbMQfCX
         PfJzWqp2wtE0Df5nGfd/yqkLI+Akz/mA8tC7F7AEuopXd/87LTcGyGhuh00eVh3ahFgW
         ytapJcG/LOm9BCrYq9v1tqmWzegyYotBK9nHAc5GeGmbMwMoyfk5Z9s3KQ5eY78HOeGB
         PMJw==
X-Gm-Message-State: AOJu0YydexwZAFBRCVZ5B+Hw3vxW9dg0Vu0/4I7FvCavdmvgtsTrkudW
	/Wd+M6N9IMUeXOb/NNuSbCqhHP9BBlRtkEYxeQGvyS+7BIqEXHf0bRQ8W62RmapkjMi/YFblf11
	puhF+QogCBFe60YQXZQY5HJ23HtuDP4vpfCqV40Z0q/Xeym3yYHL/RlTpLu37oe5403c5hWlq
X-Gm-Gg: ASbGncujWH8QGdvN/CvjGp4GAxbGIcOr4dEHbwqcIQfUkHSjhhBsxkqO+f4jK4sdcig
	ftHaf96kZ0yHB59fZVSODx1cgeQ0ouuTxfdnBZfjlGXuXKL+0BigPN2A/b4m3YjQOlw90luAl3N
	98GrwtUy2NxHZaNPShVHkPJbcwU0rUy77UnwRwaf2WOqkEj3RkcYklLQ6ce2MHAOPEkVJ1Wu36v
	Vep5iM4ZZL6BKVsFratig7iqsdIC0awi/Erm1lrRpmgYNJfu70hh/Fjg7AU6GF2Bt/zC5Z3cZ+B
	gbIII6ObfosxS0jVFNdHz0f2OEPHqy9UVieONNsLQt1aoZFhgEdMuJAstoc=
X-Received: by 2002:a05:6a20:7344:b0:21f:543f:f124 with SMTP id adf61e73a8af0-22026f59a3fmr23131381637.24.1750690126154;
        Mon, 23 Jun 2025 07:48:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFGqtCVjUZFXRcBM1U4nD9v12d4LME9X7ZOUw9dIyoCED9vqa/BJGKoM4PFDhC4Po49oe9gg==
X-Received: by 2002:a05:6a20:7344:b0:21f:543f:f124 with SMTP id adf61e73a8af0-22026f59a3fmr23131346637.24.1750690125761;
        Mon, 23 Jun 2025 07:48:45 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:45 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, P Praneesh <praneesh.p@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250605054438.1855365-1-praneesh.p@oss.qualcomm.com>
References: <20250605054438.1855365-1-praneesh.p@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: remove monitor handling from
 ath12k_dp_rx_deliver_msdu()
Message-Id: <175069012523.3758471.17375985420748501661.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:45 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfX2X1BJichnr8K
 N0xjba6g2cJN8yNN69eb3ptjoGZs/l2i/a3Q8VtyJyv3ncwAq3FI++xqqdcKdGQ4btIYC8uLleB
 I5vWoLq+QTDcslsgCn5GRbbRQWfE+NtRSfbnHuRYyJ9y20eX/ITQm/508fXiULmWubJxeyzRIm9
 4k/keG2Ek6PmPwAlZb+LDXjpqcI8dfySYLOMxYmwCj9WstWixelnIGxEyjCMm4VSXwNKpKYVsKB
 fykBylkII5AiEIt/9jFUdJhNzDMyB+1Hts/SIq00B1/6IU8lwefqzVJmcA+fZFAWFzMjLcVYZzw
 gYKv/UYIrram5cU2RjeFdmFPG6y9Wru9bC3pXH8nUWdbwWX0ZK/lfHxxPS2aG/s8PRmbb7U7QHF
 ILNJpKUxhrrxxxIEbFtQgnhUtpS/79b1+pn+brKeBbjJN+XhVnUPm7sJt3CHKd38BPLAm/Wy
X-Proofpoint-ORIG-GUID: 0v0natGZiFJ3kKXXTmbR85D46BLwSVWb
X-Proofpoint-GUID: 0v0natGZiFJ3kKXXTmbR85D46BLwSVWb
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=6859694f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=NwdkJL6YhdxGdXyF1vkA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=760 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074847_747131_4E7C54D6 
X-CRM114-Status: GOOD (  10.42  )
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


On Thu, 05 Jun 2025 11:14:38 +0530, P Praneesh wrote:
> ath12k_dp_rx_deliver_msdu() currently includes logic related to
> monitor mode handling. This code was inherited from the ath11k driver,
> where a single rx handler was used for both regular and monitor mode
> packets. In ath12k, however, monitor mode packets are handled separately
> via ath12k_dp_mon_rx_deliver_msdu(), which contains all the necessary
> monitor-specific logic. Therefore, monitor-related checks and operations
> in ath12k_dp_rx_deliver_msdu() are no longer needed. Remove this dead code
> to simplify the rx path and avoid unnecessary per-packet checks.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: remove monitor handling from ath12k_dp_rx_deliver_msdu()
      commit: 359d69285adc4f4a6a4bdafac30f3bd917873bbc

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


