Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B00C3ABBF
	for <ath12k@archiver.kernel.org>; Wed,  7 May 2025 19:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZziIjb4eIKb4RMBUaFtWOtuHPf/ab5yqngnph2mU+vk=; b=jJYyZdpX0PCYcafI9NmryrvBTB
	fsGnoJYMHEkTcDuB63eADKQWEnNjmwCvqS6pKJox+uBD2R3zyrsOKG4JV0zJfWDFaNuf5Vwkr52JE
	9C5XtGPdd0ewfgyGffoipzZ6t+buo0olziktqxZagbLgM1lixsQqoGTmsu9VZZw2PHW6bXIBZHFRf
	FEq15KGFTF2M5kX0T/B2Al254r2bHYms2dQj+GHsq/0tXi7viCCWPKtZE/FGKAiCfjMtc5aFAkcco
	D7ianncU8zOe3TR4dyR849ZMWkOboelL2RWUGenKxkAQrrDqg+gEFUr5g5EFVJI0dtalga1wLO3jQ
	SnMtG7nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCklL-0000000GbfJ-0ylv;
	Wed, 07 May 2025 19:49:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCklF-0000000Gbe6-1EhQ
	for ath12k@lists.infradead.org;
	Wed, 07 May 2025 19:49:01 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547BDbSY018998
	for <ath12k@lists.infradead.org>; Wed, 7 May 2025 19:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZziIjb4eIKb4RMBUaFtWOtuHPf/ab5yqngn
	ph2mU+vk=; b=FFQnCJsN304aDXA/CS6zeRzDXvz5YXdmL1SdM2OEhylhGY5QsxF
	vE8i9UVF3p5dyig6fwy/LRsl8YRL0/JHl3Mjr+YD40H+GeaLwmiPio0PT0jk5sv/
	kl0DqvYk18CUz7KDGncKwvaI7K92Il0LF+2H7fbXmIyiVwksWB2x2nqjfRgqp+og
	+avQbxXEjtTKdUM8JT7tZkMLri3EzwIETcmtqLCpeR1kNsGPV470Rqky8z7Jj17h
	xRUMVUoXnrf7vojGEWdUucUfIS4JU+Q6pN2LkifvT2PgJ/hCjnwcfxh+DYFB1aSM
	8GbIqVMJNmrY3suRl/gy4gNevhgmCkgWnwg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5wg6t3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 07 May 2025 19:48:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b1c122308dcso262405a12.3
        for <ath12k@lists.infradead.org>; Wed, 07 May 2025 12:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746647333; x=1747252133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZziIjb4eIKb4RMBUaFtWOtuHPf/ab5yqngnph2mU+vk=;
        b=TnVOqqlUQifIbVZ+4zICyetWOdiV5m4xEJg+YhA9Y03yy+Shin+zNnGIZumA4X1ghF
         VmamZelzZyW1ibvEooNIBMikWf1mTz5XOyS4Mr28tDDE8sQBO1klKaQMjX6beAdb+J51
         G6Y0tNZ1dx0cQcoSZ5mbsURpHHPFCQsa5d5wUCECJbu8tPX+9NJZMhSp1ebtKZyH1IK/
         riOjyzty1S8ndb8zxzjTa0YMPgPmq335RQonratQjKUPLV8z89QnYy44/Ioba7IpSeUA
         EafKSiaePDPNKcx9mhDYYM6LpMUGwaShVPtjYHULtJMo685vSPWzjNB15l3FhDaKfz9z
         NMJA==
X-Gm-Message-State: AOJu0YyUFTGo7PXw6LFchUdnV5Nb7wYgtwULqTTYFHHPWk/P/EP/e/eA
	QIOoK719XJfTrBUX979XbLTe2kPj8ZFWA4cppeB85uiahTzFIGKjRJ/FjwlSdutiG3GpbIRDRXK
	oSI67Hu0tf9LMnxw2lwAZdCCvzimw0o/tKC/myqoDin47xsnAJzVUN0nv6YElhJYKqXGf
X-Gm-Gg: ASbGncvkcuXHG/dIjfJx0O/MvnLu76L3Yz3ZwNHIhmcOkd8mVDC3y5XNl7TK+Sv28PI
	YdPpUvgRWtIaFVEKWosjsDA9j/rcWmLhbPrOehdpj3ydcT65hYhZ0mrdJDOh49dDoODG/QhUEU6
	wa0NeTtlDR1r0atDTtxTkjTU1LIhIQJa/mO1M6B9/oZUtrwZZ/3jFFHNFcFedXEX5l1VdCOy2gp
	FTqW2tFVHcXvoqrQjMBodQpleorUiH1+AAe8TJM6EfeddDrFjwq/7wRVAuVJw7mrFCs6BHuChl7
	iIXYKw1svAKkManHtBX6SD+A2/nx9S4R47TFPvBssuijZTAkwHsgxVJCjBCduRKGxHUeDWwPL22
	H9XRRGVBJNDed+CcI0zkGmD6hxWPZ7Txq089D/0aw
X-Received: by 2002:a05:6a20:d50d:b0:1f5:8eb1:d5d2 with SMTP id adf61e73a8af0-2159af6137emr767211637.13.1746647333360;
        Wed, 07 May 2025 12:48:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLoZ6f9Csaou1V/4K4TAsHQXsdeYVfCOp6u4J22tKsl5aiJy7k++4Hpx/WDC+8eAWbpJXZug==
X-Received: by 2002:a05:6a20:d50d:b0:1f5:8eb1:d5d2 with SMTP id adf61e73a8af0-2159af6137emr767189637.13.1746647333029;
        Wed, 07 May 2025 12:48:53 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm9972704a12.11.2025.05.07.12.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 12:48:52 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-pending v2 0/2] Add split-phy scan support in single wiphy
Date: Thu,  8 May 2025 01:18:30 +0530
Message-Id: <20250507194832.2501668-1-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: woqfA7J81W30m6T8twtmZSSKnL14RIzQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE4MCBTYWx0ZWRfXzJQaAbwazirE
 9xjZe+PyKelz6AIDCs6zzCDoPDMSpbPpz2PEtE0CS7QN8hSNM+HHFcw9mXsXVvYUbws/jI/E0Ov
 ge1Ujw4qo9yjkI6gDiV6jODMSafAAamffCh0aXNQ6MBlZOcxzPyZ702PUnqGhWKCsy+79rmDXO/
 OYqp4O4OyuBrzSXahGhOfLqyadxG3QejwsvsDLSZlhjHCkP/Lo7TAbKg4skM8H/IKdfRs8UgTaI
 5v6d0yCf6e5twPCXYM5Zt38l5zu7cmWLIzmbynqEGo9FmM95yTjM2VZuP1BgB4z6vc1yGkcEw7A
 ch/xDf+OUpK+o24BrfuoZUXCfNlHzd66fqnoGi/yKPeqzQN4uwV+sDi32n/SEBJA3yTf39J11t2
 jwkw3stWbSscs3JbiwNMN9Y3CF0+tEcHO2Sa2x+GI7VomQd2O4QaozVl/c8dcbxOzvc5Tj/C
X-Authority-Analysis: v=2.4 cv=dPemmPZb c=1 sm=1 tr=0 ts=681bb926 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=1ZOo-ZK77t7PqXeEs4UA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: woqfA7J81W30m6T8twtmZSSKnL14RIzQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_06,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_124857_450588_E0D2BA71 
X-CRM114-Status: GOOD (  10.92  )
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

When two split-phy devices having supported frequency range in same band
(as mentioned below) are combined into an ath12k HW group, they will be
part of same wiphy and hence the channel list (wiphy->bands[]) will be
common for all of the radios (ar).

1 - 2.4 GHz + 5 GHz Low band
2 - 5 GHz High band + 6 GHz

When a scan is triggered with frequency list containing frequencies of
both  5 GHz low and 5 GHz high, mac80211 generates a single scan request
to driver with both the frequencies. This is because mac80211 splits the
the scan request based on band.
This results in driver scheduling scan for both frequencies in same radio,
as driver always assumes that the scan request frequency list from
mac80211 only contains frequencies for one radio.
Split the scan request frequency list based on the supported frequency
ranges of radios in a band and schedule scan to corresponding radios.

Since the scan request is split in ath12k driver internally, wait for
all radios to complete their scan and report the same to mac80211.

Rameshkumar Sundaram (2):
  wifi: ath12k: Prepare ahvif scan link for parallel scan
  wifi: ath12k: Split scan request for split band device

 drivers/net/wireless/ath/ath12k/core.h |   4 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 197 +++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/mac.h  |   7 +-
 3 files changed, 160 insertions(+), 48 deletions(-)


base-commit: 889c2406b1c5e92bb83a5eb798f4966e302d2a51
-- 
2.34.1


