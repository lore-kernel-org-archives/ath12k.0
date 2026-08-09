Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5422DC5AD7B
	for <ath12k@archiver.kernel.org>; Sun,  9 Aug 2026 16:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FRMtojNYebz5pnxWFacqhhjzm6+711Mk/YGMwYi3xFA=; b=3lZWh/2xT16BYdd+AA2x7q5BEk
	YVWz+FB2L/w+YdbhlB0/tkNHOoEH1MI6iH+Bqt4UyQqpbR5gWxlwRxwBPBk2m7zAO+rE36dq/8Dan
	eLaQrn5d+L+E5XZ/xRq8opKWB0AFF94zp/05u9SnkkcCIuveUscKYhD63m2Mkk/imYeCOEu5ZJ2wm
	wF1G0pASMwvTFAJumuG2jvZpC2GX6kMkRCeVtYQna3IfPeqa5v4LvobA4yZAtRT/BDfZ0+shlHbIj
	4Q2T9lKWegBAkGDGh9jQLf/DdRwW0BMmepy3nsq1q7riTPXEQBPR+oGhNAJJYxKA9G3851/C/G63m
	NFBsqcfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt6pF-0000000AVug-3Ygz;
	Sun, 09 Aug 2026 16:56:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt6pD-0000000AVtf-0W8O
	for ath12k@lists.infradead.org;
	Sun, 09 Aug 2026 16:56:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679FMTjN3636527
	for <ath12k@lists.infradead.org>; Sun, 9 Aug 2026 16:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FRMtojNYebz5pnxWFacqhh
	jzm6+711Mk/YGMwYi3xFA=; b=Ias4j0lIMSFUAPycl6i+j0wnbv91lYzuClBcvu
	/LmWCPr61vcusvhpi7Hu3FotmTb2GvTwmxkxxyp5+Bd+aaLF4higEAz4TVT8PxTE
	CUlEp4AQH0g4TiTZ51GtlLD7G9Vwzu9PeTW4s062cZ8sWjVrDwQpWpceb+HL5d45
	quEDJztb5nJgShcZ+JHCeBc0JMBIO1BZKy4mZT2F/pheGpgLhawL/zh9JCmdiKW9
	meBmlsAYlXo7IraptnFrmjwOOAJM3dxbi3zhtNWtuwcZxRa/Izya65riLc6FDQ5R
	fr2KtTy/koRFlERN7nVIvtLvx5yR33KzJjAONqtowAHzSoPg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwudqkasp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 09 Aug 2026 16:56:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so15814055ad.3
        for <ath12k@lists.infradead.org>; Sun, 09 Aug 2026 09:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786294597; x=1786899397; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FRMtojNYebz5pnxWFacqhhjzm6+711Mk/YGMwYi3xFA=;
        b=ZI3a6SFtAewNMmsKR9R9+6OBhWdA4Rnw0dO2T0WWnkUttpNNRhWi6fzQwuNKtBqu38
         QOh39jJRQ8qcgQ3kfgJ4KOjIxLrQkpaVJq2esYmxcP7kejRgry9qx2Azam/ux7Ud5JBz
         WRokQqX6xtYpb9SXd6yf8saQGBbaEudgO1z82WV13thfN3Jk8hOILPNViN9z/tnC3D9R
         v2QR+XBdiCTYcczGUOtLTTAX9yz1d9ynsXlPr+iC2kMZzXL6u8lIpWGYUQBU0Hd6cWI+
         1WbvyW8wFEvAbxJsc9Vc253duBVe0sX7u/6EAk4QiiJKwLlinR/xvw2jrCVWxQicLgPo
         /f+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786294597; x=1786899397;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRMtojNYebz5pnxWFacqhhjzm6+711Mk/YGMwYi3xFA=;
        b=sE/orv61bmTYRlQzqWXlfY47jgfO3Zs5+oyyOrea2KQOKwqlhKwt28kpjPpOxGAmZ+
         /yF8ptCgFFEZ0TtGCW02+HG8o5IHATpca7w1IQf96LdFM7UuM0Noec/NCzpID2EFb7h1
         K3J2GUaJ5KL3pTmBR0C3rWw1vv9d6ubgWQGSTN17Aqo5x4+svYGvTLYjSQ0uf3arMCPD
         cyomlR9A2ZwshzTxU7b5kAqcKF/RpjwTACkjFD1vven0iRqVPgpWEl6psTHhiBfRicXU
         2/9oqJyGNjLPUi73ECf20gAVugmjRDhFSs7WCqN+Cf+uWbPkDXLdeghazAvwAco+GCo2
         odHA==
X-Forwarded-Encrypted: i=1; AHgh+Rpk0BbHnN38hW2rYV3d7Wma0p9YgaT3YKvB+mmDS6wPt5oVNXKI9S74J4mqtcrcidBBgV/M7vs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyM/RtNEeaYNZ04AISem6RZjwiMLQAPnO0FPxdoyLbwdCC+IvLO
	G4gZcPK7qxDLXU/fNBMZPTbckPSK0mPILXw1hgF0KB6hxlDNSi8y/jQl5MyoNoUdJuXH2Ki2t67
	JZsK5W4rqmK/ZeqrqQH0mhjYh+H0BLqQozzFwA7QoA0bVn2uCw8yLioIeD9IStVR+
X-Gm-Gg: AR+sD12Js3xdNDk5BWWQ3I+WzwhABHhXftRh3F2RF0S2vMLGqtQknJWOwTuq/kSIHO1
	XJR2VzjCO9SQLAaHSZkMeUmgwha9BMplJadym7zWY/NboVMywYoKK5c/qsnKxEdDWzlWuVc6yi7
	0PpoBGxVROk9rSk96uVC+4jOu38zGbQngs0yDW4yEetma0voIZz547+Yc1yh7FBNkY5ieX3Qz+i
	sLHnQbFVh20OR8VhL/rbjXrWfDfcymwFILjGqSqFFjQ2sej+CUVAKh46LbgR/1aGBkJ4ue/5avJ
	SG7HShwFBzX7b2G/2+yHN8yreKDTXHlJBdiHWh6/UcNDrTxAgIr8UNnplRqYNpbRUKhA6/McQSk
	Zh1aFvPsqZiuYEWFSGvvipfmibpB/0cyiy96z
X-Received: by 2002:a17:902:d492:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2d2a8458c42mr151822805ad.5.1786294597475;
        Sun, 09 Aug 2026 09:56:37 -0700 (PDT)
X-Received: by 2002:a17:902:d492:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2d2a8458c42mr151822505ad.5.1786294597034;
        Sun, 09 Aug 2026 09:56:37 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm34239760eec.16.2026.08.09.09.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 09:56:36 -0700 (PDT)
Message-ID: <8476e576-04aa-4fd6-bde6-e34c918ff28c@oss.qualcomm.com>
Date: Sun, 9 Aug 2026 09:56:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260809
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE1MiBTYWx0ZWRfX+xk4EjTes802
 2VaYfrjRHh6t4CFR3XggJO2w0jTYHLIbb25uIBol5vQnBoha870+2HcRcfsYZTiFNhIruFT5wsJ
 uOLNlRhjbQlrnBdX8THQ0veLMbX0mPU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE1MiBTYWx0ZWRfX3sWk0Ur7WJzz
 7WcuFx2+haTiBYVgLKHWtEgufXWKM63QTZXHXx1J2fPcb+kGD8eqK/P/gTm/9XgpPnH/T89QAb/
 +EnJ1YOTo6ssKvi8am9xs7HieL3a6uCiOygs8oRp3ln/JqsMaU3iO2rlCG/DuL6EeKE7w36TjAZ
 tbxuU9yjc/CCJ3UL2Oo+D7Fa1rO/T/l1ebfhjaDR6QZ2EUH+uVKivuJZfA8rwKOZ72rkP39d1KR
 bXLa8U6E6DrGOYAjEKzKqa+M5VOGytXcGupIrTRfhXa2auFj3BuZXclbfgUKNRanUACsJetcqpr
 V9IatHh8bbM1e0pJkRUywnYnw8cwEehMFXgGjlk38d2eeea2bd+lm9eWBTGiY/WYDuCz8vZfn/j
 bjV3ufFHp+Smtjo0LhXW6TIHT0qgW+dKCloQTkOawOmo/CvTckx0fzmKtRi3zaBVx8lgTMlo71r
 ADpyjaVas/zbPLxtE/A==
X-Authority-Analysis: v=2.4 cv=BNCDalQG c=1 sm=1 tr=0 ts=6a78b146 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=5BXK2PN6kyUBF_VKF64A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 7syihghyIxx_1y25lZhLPMLBoMNXpkUF
X-Proofpoint-GUID: 7syihghyIxx_1y25lZhLPMLBoMNXpkUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_05,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_095639_217570_3DCAF4FF 
X-CRM114-Status: UNSURE (   9.35  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath11k or ath12k.
For ath10k, add board file for WCN3990 variant Shikra_EVK

Please let me know if there are any problems.

Thanks,
/jeff
---
The following changes since commit 16d815da3637f645bc67e4c71b757e70ae44d498:

  Merge branch 'airoha' into 'main' (2026-08-06 12:07:51 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260809

for you to fetch changes up to 796029ba95ac00dec03264eae3807e0ea0ae988c:

  ath10k: WCN3990 hw1.0: update board-2.bin (2026-08-09 08:00:34 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990 hw1.0: update board-2.bin

 ath10k/WCN3990/hw1.0/board-2.bin | Bin 867116 -> 893528 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

