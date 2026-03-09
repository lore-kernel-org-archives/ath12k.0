Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD28FCA191
	for <ath12k@archiver.kernel.org>; Mon,  9 Mar 2026 23:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2mAeI36jMefxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=; b=KRFE2QXPduDwLZFCLx3n0aRMY9
	a2Pe4r/ZeY2nx1KISXMYFY5/MNYOcRLJDHr4NUDioXo01Iin/1mn1ssz/UzuOwwaOCxS2r2SHeP/C
	esKlqNVzq2EXaSfUrXoLDc2K9XoNWfIOZofXqn/qCscVLS6ygbjX8j/lNEj4zVsnYl3/QHRab3zqZ
	bqMxicxMThMdhBXlwqg/EgPHgyBj0uEmmmQ11LXHbtV6gakqnuT9E1Tjr82g3Bu2cbecqYT9wy3To
	JVvghqj9mG0mlkquvf/bHAGdsSwxy5IWHGiqKEnSnzrHalYs/HfBsR8S0TUXnxzY8feh277PpxPAV
	708E4yWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjgD-00000008HYO-1HNZ;
	Mon, 09 Mar 2026 23:06:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjgA-00000008HSv-3Cun
	for ath12k@bombadil.infradead.org;
	Mon, 09 Mar 2026 23:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=v2mAeI36jMefxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=; b=Mcd2vqLlUfdMNTuofAzBmFgRnc
	2aadAS4E69zSKmnBRCJJkIgSJa7f861K/dkLVyqUVx2WSnoErMjxRFecp20UxlM/sXhDrppAjbrj/
	RszTf0RU5sZZF0QS7j0ERq2+m1C5JqvJ8IhQ6bviRHkhqfKWSObiwC8//mhnSH6KJkXlyDU4dgiLp
	34zF7OB6Zr6xkJFcKMSBCaL8nidGiMc8lJEOskeH2DnLBek9uBwtWL50ZMqGVugmxYed2flm0/B0a
	ZcxRT3evtg4sDSkDgl0CJh1ZfMicUYoo3P7ix1WCBWuxzb9vFnk0uAAyVE+Cf8v2mwBwFmsFF955o
	/bMVqZhA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfr-0000000DJrD-1GwS
	for ath12k@lists.infradead.org;
	Mon, 09 Mar 2026 23:06:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBtjd1921304
	for <ath12k@lists.infradead.org>; Mon, 9 Mar 2026 23:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v2mAeI36jMe
	fxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=; b=cR9bULr3HuHIdluNoBJGFv+4inn
	oEkch/dAK8iHZXChBmP5YbxIOSs9RppPQ3TOJwqxNc6KjUG44l0NGpnP6kv+bW+n
	93OhKIOseaCH6RpcaT4bQYVVTt2zIv9g1XXzGixEOaqkG8xPAETVQCoustms+8/l
	1XL6XKajpsOZ7fXoIessDCYomEMqLT1Sx6X3lbhM3jZxWSOKB3YGmGnJ74qcBg4q
	AsE7BsGsPW2E1XJkUAqbhWuTQ8OdZtuPblMct+hrtcMMvkjsLExjzi9rEA4GjGOg
	PXDfBsHsJPiT4nYN8l0FHvpiUBgWVuZ9EIQhJ32d6/k+OSx5hXtL/yADkxQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy81uy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 23:06:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81be6f05so1097776585a.2
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 16:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097565; x=1773702365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2mAeI36jMefxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=;
        b=ETsO95OwoO8h88TNU3pgo6sApl4897mXlk6ysc/Y+yBnmK6muo8wxGEwdLKOsNs5su
         DIaIwTt17slBCRBf1+EZSX/vvSfs98geVtiZfLpGY87fkKWKismoqp42/3s9Aa6LSYkd
         FuIKaC3zEyxYsOEuUzUM4irKLeb9jGlcqVXLSA1RbUa7KJbCvUTddLKGJN/DMLVD25Ap
         zrbDr/G8lsxXaLmDwzXDHstwCedAx5Ktyv7NqKSCqeYn/iQLCn183o/LME3morDL9uIl
         DwSNBW5Z23IqcQU8oE8yvqODoPlJHHpDJ34EqO2H0yjgUT1suZYGpfwsNYkQHZMuWAsr
         WWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097565; x=1773702365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v2mAeI36jMefxLTQ32eNJQTAV5FQOsM8JFUnk8b12HY=;
        b=XjhKyTFxO/SH3rJb8L0slwG/ZuoAW5e7MbrwuriChrm/7nSZIaw8CK0tQ9cPWcEQCY
         p7RJkZDEKNtfVZb4rAdUgxAnNqYaGbN4Dap0wDIP4AFlxJaU2M9R1+rGE6UtiSOWwSld
         7DiLpkihuidEdo/+cZsyOX57c6zPJpEjUSlnmgVxk2RqCHon0t3bsJ/kS6aDBpzaDvC+
         DGDzPKdauaK6nM77F7KicnV3t+9rW9gp7GEO5ZAaSv6yOEyePzVUYC5Fni+zlUd7Ukbh
         UAuR49TPZj/iLbNh6QPf/Px1ULc4MJ7xJ/bLC7Tua7yR+rLKNjcrtfY/Oeg9aMAOQAii
         ayjA==
X-Forwarded-Encrypted: i=1; AJvYcCW9yYiqiWOL/zKAlQA8tU0tGsmZnfW29sEjkHZwi06BYlrjceGGL0TzEdTMzEliSGhgkSydUVI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxopV2UWeYKmsvHrVBIVg8fNWbHzsFPvv1XNTw/8D++BHU08nvL
	S4iMYOKQswMGbzH7ywZtIAa9j3N/AQUzwJly8gwJsRqHt+k6PFBGxF8UFTOYH4R+uL+emFuIDhl
	+CSL8UcGGyZ7gkDXQ7AyV2fg5GX9kJ9rgGPVB7vZJc7Ih3/cGic1zpLNpnYR4vt4P
X-Gm-Gg: ATEYQzxNfJqeS+okmsYZNBjhuRnKMdf8Q/RrUDRn+F1akzoCjd/HK8OQBKzPL/cMqh1
	mtbflskNd2z+QUCmZLy9jRSxUMaP60tBpFV+Z7ZOoW6q00CIlVQBU3qodyZ6ZEuRSVzFRSqD9bt
	wKyjzYHUAlX35BJYmXy3sRukz4IE1ngvsGeU08U6sXT6Dgw3ivfCxWAoMEnw6BaxzcVlXoaemyx
	sMpZQY/hyI752qr5Lg+dF8QH+oO3cEQgYTNBiV2QlJGlH6KEo1PSl2+wkz+xK30EJp3UrkwJ52U
	MFyMS0acrh/XyRTXayYwumEZzZB9+KIoNDSPAD3PRI2GwhlW3CHAmZgBuyGRs0GWPU9c0S8Nb5y
	Rt6YVT3wGnztUgtiHQ9lN+d5dKWuIz1p8uMm1fFATpON0j+S3/g==
X-Received: by 2002:a05:620a:571:b0:8cd:7cea:aead with SMTP id af79cd13be357-8cd7ceac62fmr770644685a.2.1773097564721;
        Mon, 09 Mar 2026 16:06:04 -0700 (PDT)
X-Received: by 2002:a05:620a:571:b0:8cd:7cea:aead with SMTP id af79cd13be357-8cd7ceac62fmr770640485a.2.1773097564261;
        Mon, 09 Mar 2026 16:06:04 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:06:03 -0700 (PDT)
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
Subject: [PATCH v1 8/8] samples: qmi: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:37 +0100
Message-ID: <20260309230346.3584252-9-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69af525d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=RE031ben1CQMdFOqpmIA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 1oT8zy96W-uloHT_A-EqewsOL3vr85cC
X-Proofpoint-ORIG-GUID: 1oT8zy96W-uloHT_A-EqewsOL3vr85cC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfXyGOhpkUStfwr
 qI4jI973kd2ivLdFeRpov9ZkSwaM33y24Uw71kAhoFVAjhd6eYOJvo4yP7NzaT7vKWq/JQevMfP
 sLJBctGjb1Li7zSXIE1cLMXmqTm4ChkOGMk4j0aK4r6ZBp0mMoxrHXmv0iCImN7l2BN0j3iK8S/
 vrvnlY1lh9X7kLbYRrDhJQizsRfSLlrnkybdyigD3bOHNBkjHIKz+eBhmka0cYzppBmW1rknuaz
 MOGWqWQ+phneFuO4yglp7d+JKYcBR/jSvzE3fh0SR15HoLT4mxyroZlx95OTZ11kxicL9C5LHxu
 KBC032Y0WVSmFV/DzmSTOod35FlcyPTdOxUBfH03C3MXyf+ofEzL5A8O/HEEGmigzKYgoZP/O30
 u/KshZPNgsF1DSHMqElC5OJdkLIdxX8agAHK7ELkhVLGuv1XP6kkJPix73Nep1Jn6L+PQPP+7K9
 kCgBY+XaXjRPxEcwnyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_230609_711843_B133C87A 
X-CRM114-Status: GOOD (  14.99  )
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
 samples/qmi/qmi_sample_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/qmi/qmi_sample_client.c b/samples/qmi/qmi_sample_client.c
index d1814582319b..247ec5e54c4f 100644
--- a/samples/qmi/qmi_sample_client.c
+++ b/samples/qmi/qmi_sample_client.c
@@ -592,7 +592,7 @@ static int qmi_sample_init(void)
 	if (ret < 0)
 		goto err_unregister_driver;
 
-	qmi_add_lookup(&lookup_client, 15, 0, 0);
+	qmi_add_lookup(&lookup_client, QMI_SERVICE_ID_TEST, 0, 0);
 
 	return 0;
 
-- 
2.43.0


