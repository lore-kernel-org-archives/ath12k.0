Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17C9CD8C92
	for <ath12k@archiver.kernel.org>; Mon,  8 Jun 2026 13:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pwY6r9ceSIbFZ3Z3ZupRAzVFykfNoBkJzFy9SkXL1FE=; b=PIZGbiR6Osv73/
	/57XZo1Wz+W8f+0HBEA/sUu28OB2yGlGmmSHmBXGJmU43aHiL+NsVlvmVQNX5dCuAYXUGrWCELO0r
	PdtUXW/6sbbimx52lrP1XpvzoGMtVilJgul/U0VD7cIZC5TZX0bDSxglpJ+k8kQlD9U0OHZ11wM4H
	A8pBkCWT9HprL4ExS7Pxyj5y7hdtiyweBHuMQWl5pdxgnO2y9teeuMfZlvSRVboDRorV07mkLl0dh
	c+PPkZJh6CqFbtAgSpLBPqyvLEqyBa/rE6AXYXq0IjTLfAifObgsxFZ/+zi341LhSUCoZPFN2ygw5
	PyKe3EHB6a4L8qZ0RuxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZgF-00000003ZS7-1Ylq;
	Mon, 08 Jun 2026 13:06:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZgD-00000003ZQF-0YM9
	for ath12k@lists.infradead.org;
	Mon, 08 Jun 2026 13:06:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9Uhm2993065
	for <ath12k@lists.infradead.org>; Mon, 8 Jun 2026 13:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pwY6r9ceSIbFZ3Z3ZupRAz
	VFykfNoBkJzFy9SkXL1FE=; b=AnhVfedMGZ57F2W4ocK/VnoKmZPMLi10nB9YVg
	McZxqEFO++T6rMrBQ/W4DYyzWLqR//qXX/JD+Lki1u5BRAyhF1ddNCqbQCaCKnK4
	kHzS9MKAwLRLdXd5H3F20L7ttoZ9mD8LQDo76QWfW11MDSOJTCh/GxlFaNbP/W3v
	dd6QPfaKA1+yjpt/k2NUBxp4cX73+ITo4y/JwyHQBWQ2DI68g2asaO6kVINRJGyV
	qY11nYRhqGmGyZ+U6hUX98eHooF7oa2BVMBy/zvUTbUkX/RIuQRxd5RyLGGNIJ4J
	uLgUle5tPmpYM3iBR/Q5dsSlL8ePqqHUDpvG/3qIHPgP5A5w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna8rm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 13:06:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304b8d0ee63so5919071eec.0
        for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 06:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780923971; x=1781528771; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pwY6r9ceSIbFZ3Z3ZupRAzVFykfNoBkJzFy9SkXL1FE=;
        b=GkMpr91OERShOWCEdGlTeGO+LZDvKTgcH60GkYiTlvqS3n2lIQzqYt5cndt7J844oi
         VZhXqZ+N63yPyJMcK9BPTz2F2z2YYWt+zEHpAyKJbIaDuMFLfhfZV89cQp2ybTepKKAD
         HTnZuFxu5Zun+1ESMEs/tq495xbirqUdACj/mnw0cPx9SPrvnqmfZqY9Z4/GMWWmo8IX
         6oFhQRieNVUGFvZDZSNPqRgRle5EBxsxv9v/Vpv1Rlb2dc28HeaEkRdoL+RF7ASXk5XM
         w77y2pEzf3//4LW3/Tdgwwj8+UFaYARgkwgEXKHPRqY0FXJCFa/BGvyPWhiV8SetOgXH
         48Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780923971; x=1781528771;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwY6r9ceSIbFZ3Z3ZupRAzVFykfNoBkJzFy9SkXL1FE=;
        b=WHKHk7QcKWDVnQcJPrz8iNVDUhbwme5pCg1CBBsA/oqA24wypihz33paWzwROV1yZy
         RWOu3jVKTyY1NTkB8dNSceMGkrADImxWDw5edsf0L4yn+vMMO06UydF1xYHMU507ulCj
         IOstvWc0Mwmk4ChecBiOHdb8IgLAmfEWzvmCir4VQCL/Ogg4zGNfbqfsiZjD/bXKDCSk
         S1XWFlOAoYib3UuNENT3gIA8CO/JHOKLUi+NLG1+hmFW5gOr24YIw+Awz/cNzBmkaIfa
         W19jC/TDmICgtQKz1uBtGPvMn78+6fPNcVpV1x72oTr9loVLlXuS6bj6yaNIcvqlj42L
         zohA==
X-Forwarded-Encrypted: i=1; AFNElJ+efhpk3hXYrjwgQ70TyWyqug3tBj9QSjux2iADZbEKN+KtnyagBJxpzL8tMqZ4JzL0CKxSZ/E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9XVi6aHQsElioHsCWp8npIGJ5P29AxRrS/3vPwmZ8wd5MzsYZ
	NEEDWjON5CS78UCqlqhPzl/GG4lPxxLw5gCmQgL9aUidbRJAF0pBlSguB6/r5C9vWZVPAfEen3+
	XmhQ3CStExbIC5XQVkJhvuP66yWzSvstng/GlvKtg/yiykh/6ZgvhTpMJ/dBX48k4
X-Gm-Gg: Acq92OHyNPTjzrWBoPhs4LVOQ/qmadduT+4W0TRJ53RviK79XoO7geNQJBjnS/TY0t6
	Dh796JW+pu4fJEOng6gRNjCtzJJL+utd2tY5+MBNAUOX320F9vaom3Ay2+bPnDZKMKzxWCyql60
	zx4pYhWniNKHa+Gb7bHjsLJvUcT0W7n15a0eIctHjd8be41EIvk+0T7d1aUlNDRQxRVyIyxnEOi
	zy+hZP1/PZtiAsuQ3z0pYZ9JauDUsVsixk03EKZ/Uswv4CYdSz2ji6uhzPIkdSYftLaLsT+SfrC
	JvGJTTsisEym0CrpMglr/z/X6fZjrHThpMwfBwt5VY5C63ezDSjobdbEyT9ifxLEeLlrBaNjDjo
	dE0Q8xGG4BglWl754WTuqetsd/aYcr8DZBgr5h1wVq0TYZRYdQRieA9VVZE88tyGdD61AYZZZg8
	JEHs8hx1ATZuk=
X-Received: by 2002:a05:7300:ec15:b0:304:d8e2:3c4d with SMTP id 5a478bee46e88-3077b2d9d1dmr7722209eec.25.1780923971110;
        Mon, 08 Jun 2026 06:06:11 -0700 (PDT)
X-Received: by 2002:a05:7300:ec15:b0:304:d8e2:3c4d with SMTP id 5a478bee46e88-3077b2d9d1dmr7722184eec.25.1780923970533;
        Mon, 08 Jun 2026 06:06:10 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dba9d43sm15666701eec.10.2026.06.08.06.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:06:09 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next 0/3] wifi: ath: Update copyrights
Date: Mon, 08 Jun 2026 06:06:05 -0700
Message-Id: <20260608-ath12k-copyright-v1-0-e1a71f92d447@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD2+JmoC/2WNwQ6CMBBEf4Xs2ZJtESKe/A/DoZaFbhSKbSUQw
 r/bEG9eJpnMzJsNAnmmANdsA08zB3ZjMvKUgbF67ElwmzwoVBVWeBY6Wqmewrhp9dzbKIpWlgp
 LrC+IkGaTp46XA3mH1BYjLRGalFgO0fn1+Jrlkf+w5T92lgJFJ81Dm7prC6puLoT8/dEv44YhT
 wLNvu9f3gVrdMEAAAA=
X-Change-ID: 20260604-ath12k-copyright-3d1520509800
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNCBTYWx0ZWRfXy/GI69/VEdWh
 4k3r9y1skq1QQxKeIUX9SL5V4Z+vuecgnXsQtWpNWFgurXp0Pl6pHBiZj6bwTS2wSST5We70u7y
 /NEyKCHpkB2ATrJftVctm5+3UGEZshzvsTCesvL7yWdMviGevpci2iSf1IPclu6/3ODQHRZgR7n
 3VKQ2Xpi4FtqFwRiQLkymgIQJ7zVmb4UMFebTRxdV5QGnwc0TqI2DAFdzU9LDaYKc0lvAthIk2h
 KFSquo4Iz7epAJx6baZaOc75tzggaxWvFkowDLH+Zx9yt8RvuiSzA0voWnLyBWKjWK2MpJAfrWJ
 2Y5bB5dLn7xG6DnTCSVe0Dvk4V8bVsYK6MgrkW0dRhuDimSfMt3L7VZGLPP9uGeZ5YGnzBE8y4y
 kwQSFUIXnpC4kC9fOc5GgRJ5+6RlpmAMOjQgm/cTIzqOaRQvQAvryTfxvvHdXZZCaU/dEEVqyR6
 ges+f5s4omrnFMZP9zA==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a26be43 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=dk-9R-U10jJP_KFx_BcA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: KXiqNIY4Q4YkfvytnSJsR6BYTYzT5V0Z
X-Proofpoint-GUID: KXiqNIY4Q4YkfvytnSJsR6BYTYzT5V0Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_060613_170359_400DD20A 
X-CRM114-Status: UNSURE (   8.01  )
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

Update the Qualcomm copyrights in the ath wireless drivers that were
substantially contributed by Qualcomm using the current guidance from
the legal team.

---
Jeff Johnson (3):
      wifi: ath12k: Update Qualcomm copyrights
      wifi: ath11k: Update Qualcomm copyrights
      wifi: ath10k: Update Qualcomm copyrights

 drivers/net/wireless/ath/ath10k/bmi.c               | 1 -
 drivers/net/wireless/ath/ath10k/ce.c                | 1 -
 drivers/net/wireless/ath/ath10k/coredump.c          | 1 -
 drivers/net/wireless/ath/ath10k/coredump.h          | 2 +-
 drivers/net/wireless/ath/ath10k/debug.c             | 1 -
 drivers/net/wireless/ath/ath10k/debugfs_sta.c       | 1 -
 drivers/net/wireless/ath/ath10k/htc.c               | 1 -
 drivers/net/wireless/ath/ath10k/htt.c               | 2 +-
 drivers/net/wireless/ath/ath10k/htt.h               | 2 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c            | 1 -
 drivers/net/wireless/ath/ath10k/htt_tx.c            | 1 -
 drivers/net/wireless/ath/ath10k/hw.c                | 2 +-
 drivers/net/wireless/ath/ath10k/hw.h                | 2 +-
 drivers/net/wireless/ath/ath10k/pci.c               | 1 -
 drivers/net/wireless/ath/ath10k/pci.h               | 2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c      | 2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h      | 2 +-
 drivers/net/wireless/ath/ath10k/rx_desc.h           | 2 +-
 drivers/net/wireless/ath/ath10k/sdio.c              | 2 +-
 drivers/net/wireless/ath/ath10k/thermal.c           | 2 +-
 drivers/net/wireless/ath/ath10k/usb.h               | 2 +-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h           | 2 +-
 drivers/net/wireless/ath/ath10k/wow.c               | 2 +-
 drivers/net/wireless/ath/ath11k/ahb.c               | 2 +-
 drivers/net/wireless/ath/ath11k/ahb.h               | 2 +-
 drivers/net/wireless/ath/ath11k/ce.c                | 1 -
 drivers/net/wireless/ath/ath11k/ce.h                | 2 +-
 drivers/net/wireless/ath/ath11k/coredump.c          | 1 -
 drivers/net/wireless/ath/ath11k/coredump.h          | 2 +-
 drivers/net/wireless/ath/ath11k/debug.c             | 1 -
 drivers/net/wireless/ath/ath11k/debugfs.c           | 1 -
 drivers/net/wireless/ath/ath11k/debugfs.h           | 2 +-
 drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c | 1 -
 drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h | 2 +-
 drivers/net/wireless/ath/ath11k/debugfs_sta.h       | 2 +-
 drivers/net/wireless/ath/ath11k/dp.c                | 1 -
 drivers/net/wireless/ath/ath11k/dp.h                | 2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.h             | 2 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c             | 1 -
 drivers/net/wireless/ath/ath11k/dp_tx.h             | 2 +-
 drivers/net/wireless/ath/ath11k/fw.c                | 1 -
 drivers/net/wireless/ath/ath11k/fw.h                | 2 +-
 drivers/net/wireless/ath/ath11k/hal_desc.h          | 2 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c            | 2 +-
 drivers/net/wireless/ath/ath11k/hal_rx.h            | 2 +-
 drivers/net/wireless/ath/ath11k/hal_tx.c            | 2 +-
 drivers/net/wireless/ath/ath11k/hal_tx.h            | 2 +-
 drivers/net/wireless/ath/ath11k/hif.h               | 2 +-
 drivers/net/wireless/ath/ath11k/htc.c               | 2 +-
 drivers/net/wireless/ath/ath11k/htc.h               | 2 +-
 drivers/net/wireless/ath/ath11k/hw.c                | 2 +-
 drivers/net/wireless/ath/ath11k/mac.h               | 2 +-
 drivers/net/wireless/ath/ath11k/mhi.h               | 2 +-
 drivers/net/wireless/ath/ath11k/p2p.c               | 2 +-
 drivers/net/wireless/ath/ath11k/p2p.h               | 2 +-
 drivers/net/wireless/ath/ath11k/pcic.c              | 1 -
 drivers/net/wireless/ath/ath11k/pcic.h              | 2 +-
 drivers/net/wireless/ath/ath11k/peer.c              | 2 +-
 drivers/net/wireless/ath/ath11k/peer.h              | 2 +-
 drivers/net/wireless/ath/ath11k/qmi.h               | 2 +-
 drivers/net/wireless/ath/ath11k/reg.h               | 2 +-
 drivers/net/wireless/ath/ath11k/rx_desc.h           | 2 +-
 drivers/net/wireless/ath/ath11k/spectral.c          | 1 -
 drivers/net/wireless/ath/ath11k/spectral.h          | 2 +-
 drivers/net/wireless/ath/ath11k/testmode.c          | 2 +-
 drivers/net/wireless/ath/ath11k/testmode.h          | 2 +-
 drivers/net/wireless/ath/ath11k/thermal.c           | 2 +-
 drivers/net/wireless/ath/ath11k/thermal.h           | 2 +-
 drivers/net/wireless/ath/ath11k/trace.h             | 2 +-
 drivers/net/wireless/ath/ath11k/wow.c               | 2 +-
 drivers/net/wireless/ath/ath11k/wow.h               | 2 +-
 drivers/net/wireless/ath/ath12k/acpi.c              | 2 +-
 drivers/net/wireless/ath/ath12k/acpi.h              | 2 +-
 drivers/net/wireless/ath/ath12k/coredump.c          | 2 +-
 drivers/net/wireless/ath/ath12k/coredump.h          | 2 +-
 drivers/net/wireless/ath/ath12k/dbring.h            | 2 +-
 drivers/net/wireless/ath/ath12k/debug.h             | 2 +-
 drivers/net/wireless/ath/ath12k/debugfs.h           | 2 +-
 drivers/net/wireless/ath/ath12k/debugfs_sta.h       | 2 +-
 drivers/net/wireless/ath/ath12k/hif.h               | 2 +-
 drivers/net/wireless/ath/ath12k/p2p.c               | 1 -
 drivers/net/wireless/ath/ath12k/p2p.h               | 2 +-
 drivers/net/wireless/ath/ath12k/reg.c               | 2 +-
 drivers/net/wireless/ath/ath12k/reg.h               | 2 +-
 drivers/net/wireless/ath/ath12k/testmode.h          | 2 +-
 drivers/net/wireless/ath/ath12k/trace.c             | 2 +-
 drivers/net/wireless/ath/ath12k/trace.h             | 2 +-
 drivers/net/wireless/ath/ath12k/wow.h               | 2 +-
 88 files changed, 68 insertions(+), 88 deletions(-)
---
base-commit: e1c8fcfd37f76b46a581b794e27765258c9a537d
change-id: 20260604-ath12k-copyright-3d1520509800


