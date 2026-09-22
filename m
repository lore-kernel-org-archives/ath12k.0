Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E40C982FE
	for <ath12k@archiver.kernel.org>; Tue, 22 Sep 2026 01:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v66LYWtKI8kl0sQYCAEnWhcI4TUzobxM+G7V+VWy7YA=; b=ew2xWLhFXNTXnOcANRpnPvk4jt
	ftmVYHl2G30JwkpxVw+6txcZKqSMnH8XN/bsvM5hgAsxTmlM9AHtRdWrVCjNDhzNun1+cHiep149W
	vGMj1BJKaUcgV+6Z/7Fi0W30NLtaPiiUCE69V7Oha8KUkwVMIjAG17h4lddL3FtZ0V+SZNo2ctFAs
	oICbj2s+MwEcFmV0qCG8ikiA8AHGaKYZZpaGsHfojvCgHVbsooMamptibu3UejIQfxO64FkLrqFAv
	Mc2zgu2u9uSeC9Y2F+ruzdJXaICAJL3VXs9ln2vw35XiR0XA54rQ2HASeR45jtDrGFj0FXGIXPLB6
	xjfMhtfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8pGC-00000003svO-1idz;
	Tue, 22 Sep 2026 01:25:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8pG8-00000003suC-2uXT
	for ath12k@bombadil.infradead.org;
	Tue, 22 Sep 2026 01:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=v66LYWtKI8kl0sQYCAEnWhcI4TUzobxM+G7V+VWy7YA=; b=J4IH+qw0aGrAb95ftgAnKLgA29
	5WEghTUjICsfBkDuyJFPRAa2H16wTIJqpi3haYVaLefT3RZdjK+P8nYFOpCcc5zVR7FSiylQMvuGr
	LGIiFPN0FSmFlSjgHoZjZMIU/PAzx9+pzpsacpfiNNdzailNZVV13nmtbxw8SAAp6aa+/x0Gq7jrN
	NCxYrzKSaTpPHJ+DWJa2q0UAHfOCHcwIlu4lMKfmREpEmuN586HM0mLtEW0UpwIUnA0tgr06capz7
	Spgbkuh1lsoeDRkbk2YxDvhz+EanLVt2m5IE7lBV4+6DdLpZkPsBqfWZPz5onZ5PSweRDifAEbOxc
	RrXJSBbw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8pG5-0000000CypN-0JvB
	for ath12k@lists.infradead.org;
	Tue, 22 Sep 2026 01:25:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M0eYdv3044076
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 01:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v66LYWtKI8kl0sQYCAEnWh
	cI4TUzobxM+G7V+VWy7YA=; b=IfZgR2ujMWGQcEz/UR6Zju4tHgRvaYK9eBrWXF
	oHAMfFV0V5DSpCNoka8lw+n99HXDBDL7Yp56o1ynk92YQ2kUZceFTsXONB9T303v
	pTWsuZ1H515EL+ZYW2M4JF+SmKHGLnMB7h/js0OYKqvF7n1i2yErUEKd866tC9zJ
	3fxgaL5sOWUqIJgZviyNCr6fXLmlnFTxjfHWseIYmflxFdaheziu7SsMbT2MNu0S
	GipnThY+3kT5wxatjNFwKUi/QvgbXuXAyQYvvzrix6TJeUVDVUk/dM97v2QJeMtq
	R0Td3CZXjcLyxR/JXGHO5WUMUCB+lPxMK5v3gLRpcuQ8vxNg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbar4gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 01:25:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b8088203so3110324a12.3
        for <ath12k@lists.infradead.org>; Mon, 21 Sep 2026 18:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790040317; x=1790645117; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v66LYWtKI8kl0sQYCAEnWhcI4TUzobxM+G7V+VWy7YA=;
        b=RonEnZFP4PFq0ggkiJdTm4lgScUE6Z5DKhuOI8Te+JzGbhY0tUueDXd+IRmq6DCpFp
         J8+XsHYE2ud0T1iPo131NyAwhEMp7bW+r/IeXLJmKEG4/xQOvwHss+3G6iBNNkPSNFpW
         babS5A5j9s4JkRXxnZnafWP3jXep9WrvOj2imvMWzfLFgD32rbKP3m5iYGwvT57508uH
         QdF2R9ZZSfhuxripKp4in4q3Moxx9d6KdmR1Q7Vu158d/kVZPcE2tTnIer/3OuCQNszG
         VnDlLdMHfIrzpMgE5k3Vg0QYKNwKtIGaeg2qMZYef+S3rF9PzhCj1DsZ4pCaSvLCNXB1
         fstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790040317; x=1790645117;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v66LYWtKI8kl0sQYCAEnWhcI4TUzobxM+G7V+VWy7YA=;
        b=GwaAHffr+vyB5cl1X0P8MHo6+PnQERVQ/qM/4XbEkvmdSCCSRJBJY9vGYYzN6bRNP2
         7y/9L6df+rquaaD3cXmrkan9n+BjtUh1/T3YcgzvsyTOLw7lRqj3xezHIkcqBdopls6J
         8L7vWbaRogC18lMilpHNy053TY43tal/D7f9qgvFFi1ZN10X+r4S51YwflrRk01ZyFEm
         LhpbJmxO/0nbVOVhyiYo4VYuJ05+KmUWUsXlAU73Ouhwjogz0f4oFx34c+rVzm3pYLVH
         mRe5Kkedg4nqM+9Saga7/sjErbEZ2GaCjoBgmgH8DKpZ0LQuf9vCn0jju2ghfHpKcz6g
         IX1w==
X-Forwarded-Encrypted: i=1; AKwUvBxOy0DMI+utTCZ+q72I5ugQOxy8Cr30NbhymyDkLm6+ssI7qzgRjrJ+zjfjMP08+mcKWVWnpPo=@lists.infradead.org
X-Gm-Message-State: AFuF++nvimPszfjXNtzR4O7kTB9wYwNoSUfjLsl5wKJ0GsVwBa1ZqnBN
	t2sufjVRfNqDWmPSdNmvEDDLxd1Ac54yxfIkLRDTr2bTAjpBYFXkagn9mip1OcmCT65P19fd9HF
	zigbnJ+EtcP2KFo2oZSl6JB7/GBMlqM83fbwROnv0Kt8R8Vbwv3Aa5ppHi63vFWKsFE6sqM0E
X-Gm-Gg: AYBFou0Os4S/MxYbPWhmh6LK9hr3P1wIojMopXpW3G4R6CHEp6sN+4iPhQDw/g6w2ne
	8EdcTgZ8wqEa54PBJv3PSAcwop2x7wMYDFaeUkqy639jgpS38Di2CBH2X2w+0x4TlWvm29Ti/fC
	zjdEQtqErFkXcN1To69ZqlJGqozdSwKe3Z3V6+T1W4oURoTYv/4gOIo/2LXx0hlWg62BmBrEYMe
	qRDUpzOy/UlsZ0yQwQ42ooJ/bM57gBY1RxQ6RQAt+kDXc/wDDOxAVcDrX48NTYtNakXPCDvkcZE
	6B2/CINT+Sd/4kzs7Yp7jX0Wy2v9J/yHeCgCzDG7n1AEjoIpLaOSJ5Y/Y3om0NBta6epylPjEd9
	CN7Zmwo+ei3DrVcT0Tyh7W2Ui0EJVFoD5LO4=
X-Received: by 2002:a05:6a21:390:b0:3c3:bbe6:95de with SMTP id adf61e73a8af0-3dd8c3d18afmr21360147637.6.1790040317024;
        Mon, 21 Sep 2026 18:25:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:390:b0:3c3:bbe6:95de with SMTP id adf61e73a8af0-3dd8c3d18afmr21360124637.6.1790040316540;
        Mon, 21 Sep 2026 18:25:16 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e613014aasm781214eec.22.2026.09.21.18.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 18:25:16 -0700 (PDT)
Message-ID: <e142b46e-4cfd-4531-8611-717612e329af@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 18:25:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260921
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAxNyBTYWx0ZWRfX7idqmdF0Bs47
 KKNNd1GkrQVaDjAZydoo75i9LtnoLyv72MywWRS9aSMjlM52cXIYGo0lqg8OE1CUi0gUU8R9MfV
 4N7CRSlB8wOczlPrrsBd8USMtORJV4Z6TbZXdmvlA6DOBBCW1FMz8vv8YrwIrmWTMOQE/j5BfQh
 e9Yx/+ZoLHOgWjtjVd+iqgPNH4YIdhebeQY5xsQzCeXDgVWNOg8m7cxpkCBKtXCOBdRcJeNXJI+
 rwMauSG8I0YcwZLfHHrl/gkkP0+ORNWH7p/XcB1gl/b8fvi7P8USgAg6+Sy4es0b3jVegRSBq/S
 kITZSt5N/nMmcOUdyW963A6/YwApD0vwBfja1dqOv+ahuI8SmWCHsZomRxfOD9+0nTOKeedUyNO
 QTboRbGpKv/gkpv1NSbSbNa7f5hJgPL0LZCndAdyfNAYe6oACL8xZpZZGegTK/qtqpKNDsa9kkE
 50HgvP2XCdCUG6eoh/w==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab1d8fe cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=915--R92nBw2hSefkU4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAxNyBTYWx0ZWRfX0sZ1z1O2ebZ1
 7RbBFbdgMmwMP1kxEYiDJ4JtcMNIQ/xl3eUhJeq5PaQr2vt8YcoQ0wXlkQFRD4KNpoeT7kOUZdr
 C7k6w1m4A7Dak+HiI2PoR5TyZJTwIMQ=
X-Proofpoint-ORIG-GUID: bQiQM8XpDPYcnaN5BakNi1TF2XB_qlQD
X-Proofpoint-GUID: bQiQM8XpDPYcnaN5BakNi1TF2XB_qlQD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_022521_574258_96BFDEF5 
X-CRM114-Status: UNSURE (   8.17  )
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

The following changes since commit fefaac1176bf3cf002a8dc83339d6ed6a369941a:

  Merge tag 'wireless-2026-09-16' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless (2026-09-16 15:54:56 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260921

for you to fetch changes up to aeaca27c1db3106967ffbb2b517d98c835f6d500:

  wifi: ath9k_htc: bound TX aggregation to MAX_TX_BUF_SIZE (2026-09-21 10:58:00 -0700)

----------------------------------------------------------------
ath.git update for v7.3-rc5

In ath9k, harden the firmware interface and correctly handle a flood of
large frames.

In ath11k, fix an accounting error that eventually prevents clients from
connecting.

----------------------------------------------------------------
Georgios Karantzas (1):
      wifi: ath9k_htc: bound TX aggregation to MAX_TX_BUF_SIZE

Nicolas Escande (1):
      wifi: ath11k: reset ar->num_stations on hardware start

Pengpeng Hou (1):
      wifi: ath9k: reject short WMI command responses

Toke Høiland-Jørgensen (1):
      wifi: ath9k: Clean up device initialisation guards

 drivers/net/wireless/ath/ath11k/mac.c         |  1 +
 drivers/net/wireless/ath/ath9k/hif_usb.c      | 19 +++++++++---------
 drivers/net/wireless/ath/ath9k/htc.h          |  1 -
 drivers/net/wireless/ath/ath9k/htc_drv_init.c |  7 +++----
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c |  8 ++------
 drivers/net/wireless/ath/ath9k/wmi.c          | 28 +++++++++++++++++++--------
 drivers/net/wireless/ath/ath9k/wmi.h          |  1 +
 7 files changed, 36 insertions(+), 29 deletions(-)

