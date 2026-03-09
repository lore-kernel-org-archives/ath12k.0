Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503F7FCA19F
	for <ath12k@archiver.kernel.org>; Mon,  9 Mar 2026 23:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auzznPiIzKmn9bZWwZ9h7mLY2h3ZNHzFBrhGQFkkIvg=; b=qb2wbayx0D1joOEM6O9kFblcFv
	lgEtdp9X9dgu7N4YOGtlv3rxI+WhlwoPYXBH0JTk6DIVoxLNqJv+Kj3KdESBjZVPVZsqnsQTyDdtC
	ySKOrhi7zBgbiYQn0CWaEeNAWwS7RTUTfKZSYnkY5wRe4jrS4wGGKihwUNLxYDLcVkRUDOhWjJ1Bs
	XxxBC1jA0LqZR9R2Ba17i5juq/ORmPXSeIiAzv5V1Tf1JB5axce6bCztJioV9ZWXVxUOzCYA1JDi3
	3gjBboC06RzPgc/6yzsQA7o8uwlxiDtiGxqjd5TvuuGwFDEJ9/Xqv60xWB66z7qJTN6PIkW6wGNG6
	7k6hBdaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfw-00000008H5P-3ck0;
	Mon, 09 Mar 2026 23:06:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfn-00000008GsS-3iNY
	for ath12k@bombadil.infradead.org;
	Mon, 09 Mar 2026 23:06:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=auzznPiIzKmn9bZWwZ9h7mLY2h3ZNHzFBrhGQFkkIvg=; b=NGRRxcEFiDaiMmzjssxMqCZOnW
	fXKEKU3JWYfjY4iZqKEBxcTbBynizsYyLIYW5PZIQoKxh8jZJxLHqvyya/0P21eAhIEpXO6F5HFcp
	TgJAtm4eybhId9nojJS+TxpWrYDTjnMtJRmLB6am3RlVzW+N8VGTN6UBEfDelrfz9wytP/3KgEdqQ
	NmjUx8qCkRPCtOBhJikZ08O9tJDwSLZiSNN0HtSTe2l6plQQI0n4O3D0cZatd4H92SJRrvvp30Q8S
	dF5Za8ZGbAHc+GL3Qa1dN0lm56KcHxpuo6yExyEGNFcXNBSIcopy13YuVYWPNuHz8djpHiAqTcic8
	2KIM0R0A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjff-0000000DJnl-2nCM
	for ath12k@lists.infradead.org;
	Mon, 09 Mar 2026 23:06:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBn4b1203506
	for <ath12k@lists.infradead.org>; Mon, 9 Mar 2026 23:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=auzznPiIzKm
	n9bZWwZ9h7mLY2h3ZNHzFBrhGQFkkIvg=; b=EPv3YztVJ+FAUct0n2jY0AEZbxq
	N4yJ5ZDT1QeglA759UBVXPrEh3zXHp5Ray5s7pgfyA7mLlCX3AQyJdv4N0XHVz1V
	OZ9QVTI8oCqhTWzLM+cVUnCNq+4M5Yzl97VoxT6SmJnlYgveq6RE7m8Y0lU7CCcx
	k8Haf9d+4068xXR+NUlHuEi8Xqxp2N3uCUYTJneVk3O8E/tX30xB4TcMIxeqWoZ0
	JUFI6cMGgngrsXg/IZO2SB9y28JcPOBNpWnXBZTf8w6+yGT4I/WFdTaYfJcOf32Y
	WMB2yW2wjsiFRzhTaGFIC4a37N06tgo/lxuGc/eVVPmJ/AV+usj7OzLW6dg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct0329n38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 23:05:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd77502295so1418673085a.1
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 16:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097553; x=1773702353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auzznPiIzKmn9bZWwZ9h7mLY2h3ZNHzFBrhGQFkkIvg=;
        b=hUEW6hbkFYd+hNbbod8bpoSokn5Uw0Kc4chQ68BlN+JihPLBKddFfnbOx0YLgIh+SM
         Y0GwComHeFDrK10Nh/qjvHaVFn7msPZj5iHNwOU4biLN4ghDFefRF3d44kwFDm/THiFK
         MCjeiDElMz6N8gcMTpdSnmdkz9xNrNkmXAS+KHT3bWYbiAG9wZAiIwUQxbbdf03W0bDY
         BKM4gzbJZMTHhahjdCP7dtBtRQgDpLZ0TyFHSQrUZBarYEMYEAnavqurRRVIuAS8V7A8
         qVlyl590ZkIKXp6X21Qf1LE1JkAAIVOHpGGN9+uYbcqUpDcq8nOMmsD9UK5d1PkPNxDO
         JBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097553; x=1773702353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=auzznPiIzKmn9bZWwZ9h7mLY2h3ZNHzFBrhGQFkkIvg=;
        b=bSDLvS14RdBVBkXttNFQUOWiTPfUjLep+RVbTQkfgSU5/NFAZteDKaQ8PWIELwiqvT
         H7RCImgKbG3kIXMOZNCslr+h8MJwLm3xQNrnKZ/xpKAGURiTKAiJ1hxvvseBuJbnfnJx
         Ltg+IDVqGs7on4u5Q5vCnpDtNAhHq2IIhQH/OncRmv5HatHx+DQnRJMde+jdTy+AB9K3
         U4QZZS6tm6cHLHHwuAaCALjZia5pT5IEG3z9A/1szvQhWfhSTcYPoCFj3Jsh/jNADudT
         P9lFOduyBCUv/DYuGAdbvK6+dNrEE9frZ1ODyYCUiFQOall9e8VftR+Yq4yPX4+mCfaP
         Xj0w==
X-Forwarded-Encrypted: i=1; AJvYcCWZxU6nEKUzCLpkJfOZN9hUqfmv8MndzwiC0BMvHDgtXIvE9nYnUuJcdbix48wLy59oNKMliwo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7xFbY1iHi4tlmU9e/pJm+ryoJ3LpZYKobggTXjnb7CQKrFDsb
	TUW7H/C2ICmC1lqRBvoYbl6sMOvac6G0urXngALSaNCAB9cjCUrmLP0Kh4AKRkiC9kHiIw9jyNc
	X27CW74Azn+E74/0aSqBxp+WGuAY1kjL3hUdm8FeilawoNzhGCk14W3kqBoX1NPnu
X-Gm-Gg: ATEYQzynSCEtqYKh1CS/1eo6g0FWac18RlmAvy/gw38AzcjQOpMxQgDlIzKP7FvWyAF
	EvvZFSDUOgxIr2IIDUwKUxDv4P/PTE3400qwlZkBiujtniX40NRAdfWb/jHVVfCFs1f9/+4PIwc
	8casmopWcm/795ILjEHu9jWH3iwI8wGYnKu9lDsIouAItrQ4ihV/ZrMmNZSfZ/p64XajEn+EDru
	hnMhzGfVdK9Ii6souPDjIIReQs5MDH5Vsf89bnXawjHQ+vGdcT5NVh9BE1ozP7AnN9GjzM6/sKP
	NvjCq6+yzBAneanRZnPPxEM7lrCpQO6ZnHabmjpd871HaytSJsSYnkT1bId/QlLPL/IUO4mfbTV
	mVJRN49qcPsyPZmWDolGh5hBHQlhJkLwrxMjGiE7INT/ggUe4Lw==
X-Received: by 2002:a05:620a:269a:b0:8c7:140a:7dbf with SMTP id af79cd13be357-8cd6d4fcc9amr1622778585a.77.1773097552993;
        Mon, 09 Mar 2026 16:05:52 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:8c7:140a:7dbf with SMTP id af79cd13be357-8cd6d4fcc9amr1622773385a.77.1773097552533;
        Mon, 09 Mar 2026 16:05:52 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:51 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v1 4/8] remoteproc: qcom: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:33 +0100
Message-ID: <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX8mEcPM5kSKVT
 rSkPWk7oIA6GFvV/7Lc3p1wg1cTirq1tzYCK0OFmgMxEU1m0eoM/9IBdX12xo6Drsj2O8ov2Bla
 g334MYRpb2cwH6eFbY8YN84L5bED/6vq1/m6CgjAuTMIBDxvAHbOKxP+fK9VHhAv/H2kZXOpFt0
 pwIvv4PTNgaEhMXVMVTYYZPEzSDm0pAXG7EritLZqvgAqajunL9QCEdiwZRBMbHujoMkQ6K4WU8
 2KRDw4v5GoLrdY2K0TmrMHjmkdyrrT+nLsgNd0KhfzJ8kOqqibhQO7BshDYnJmDoOLjqkTzegf/
 IKdU1cPMGMdEhVAqs1BxQTk+JmvuDszsCSN/2N0SvP7KB7h/sBXRTPNiGWaMa6DHP1L4MZiVHXD
 1LuMH+ImmNUYK4Yzm88HBOIHNj8hxAVtOIIVLD6O0ldn5W/rM0mtLr1aMbEl9UKENi6SXt1/u2P
 gfHBFgIxPVNfIjZnVmw==
X-Proofpoint-ORIG-GUID: jOs5YJp-FIGfuUfpbtkw9KOuPcvnUsfi
X-Proofpoint-GUID: jOs5YJp-FIGfuUfpbtkw9KOuPcvnUsfi
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69af5251 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=LIGoIQd8k4OXu6S84WYA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_230558_924541_52F4F604 
X-CRM114-Status: GOOD (  14.40  )
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

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_sysmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index cf10e8ecfb8f..5bd4147f1f37 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -677,7 +677,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 		return ERR_PTR(ret);
 	}
 
-	qmi_add_lookup(&sysmon->qmi, 43, 0, 0);
+	qmi_add_lookup(&sysmon->qmi, QMI_SERVICE_ID_SSCTL, 0, 0);
 
 	sysmon->subdev.prepare = sysmon_prepare;
 	sysmon->subdev.start = sysmon_start;
-- 
2.43.0


