Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6644ACA5FF0
	for <ath12k@archiver.kernel.org>; Mon,  5 Oct 2026 15:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVaB5GQWmscg0rsYJbxE8vQsJhAyc7OQmJS8eF/75jc=; b=3eGr31eNGcaM1JJ88UfC/T+hRF
	xifCVpllMQn99GxtB0gIpv6EipZ8kxHf9qaJk5qUVWshgE9jX2NPcbInNxAM4wtCXezKtq4JLkB3M
	DLUKHLvUzrm8xytnRQoQ5/4f6h9VtqpEcjxqbLgR8MXMhme+fr8ksf+lpnyG0k5NCyPY4sN7W+JR0
	/4nrB7Ewbr4BYrX8PtfLHjXNH+q/tLNeO0tfxbCs6CJD0rYkWgZeQco+4W0uyreh4ofZMtnqMAfJR
	6y2O9nlsGAMrwHReAe20lvqAB+7ytafSCX8VYa6QOpdHWq+BzsNPZ+OQkCk0QgZ0b3CPAhpgaFaAL
	DUpWrtoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkKA-0000000GjSV-00c5;
	Mon, 05 Oct 2026 15:09:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkK7-0000000GjRL-3KDM
	for ath12k@lists.infradead.org;
	Mon, 05 Oct 2026 15:09:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EP1Mw1195630
	for <ath12k@lists.infradead.org>; Mon, 5 Oct 2026 15:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oVaB5GQWmscg0rsYJbxE8vQsJhAyc7OQmJS8eF/75jc=; b=VPgqw66dCbZZr3T/
	vYEoQZULY6WyvCrsI/P22CIqOIEadYzZVxzY14pyaJlSd+yltII6PJxxBHl9k7J3
	5oxliKGHkUHU90GQRkFDEd3tyl1Ec7nb6LYZLOSRTJuqBQczZW/jOLweqb38AU+q
	ky/Eon8/vfFpLt03MWF0F36i/Et/sa6/GNdA5qO6YbpRJManxLQbNa9R8vyNVq+J
	4CiW+TO1N8wFKBNuszUVlQHF48fPXxhdT/970tADddSWuQLQrPX1yVj8TsBPIR1q
	yg1CUFnnoSYmB8v3saYAzx3q+QYgMvw4wCcCTTAl7fV/2NXLiS/wFvLPkHeOnWfQ
	+Uz/8w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfmafk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 05 Oct 2026 15:09:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df8d1e91c9so34150955ad.0
        for <ath12k@lists.infradead.org>; Mon, 05 Oct 2026 08:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791212990; x=1791817790; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVaB5GQWmscg0rsYJbxE8vQsJhAyc7OQmJS8eF/75jc=;
        b=afXq/I2kUK+8rLryX2OQ6J3tn58KgC6k/vFRFkcjXl0XjeGcbJCu01XInofVaKIqDC
         uuYxGUHpcSmBOcu3pyrQBb6ojuTdiYZM8DkFt9sUtJLPVXu+HwPb52bzaoysnf0S4KE6
         5TMmgMj9+1QrvyOAS08Ngp106idD/U/JRL48JIBGpcip+QCPE369kfoMc75axLgo33gP
         IR66c82Oi/B8SAfRSfP4M6uYWBCMhW73Lv5MIvJJ+SN1paYdpCe4onFp12jpkhmdIBlK
         XJA+jXR+fnHUuCPRS1TC1ScQ6dWtGvARKIX4a26E98RhlJIh+ihTR0i5XIGJU/7MG3K4
         //aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212990; x=1791817790;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oVaB5GQWmscg0rsYJbxE8vQsJhAyc7OQmJS8eF/75jc=;
        b=v6a6w4/5fwNeDDzDOl4s5V0HGTEkCTkl3eXxgdE07WkxCAucpKK6faSHH9c6p9IWJQ
         k3I78KWwLEGzK6A8hatMvjCnGjjzXf+jL8Crv2Qd914kikvMYNcaWrsIDWZn0hbUkeAM
         xdMmztK9svx9vjeOBB/9AqtAszFZCAmga3/6PM9ytvl3Q/Ac7RNRD72Yik4dS2H3Cq5q
         s9ajOmITPqlKTzxtYTUHMqsrCPVLzhIUUSnygKMhS6Obnh1bgiqGTDgCHMAeISG9OwFR
         /RlBajtB280l8QC2zJWHe+Qba+X7X4qfIaf9CalgYuz+62xNST65h1C4oGQClvglLlK8
         LeZw==
X-Forwarded-Encrypted: i=1; AKwUvBzdk6PNNhRBgkAHcOyBjOkvl99b6dZ6Onj9fokkq/23qge7076LLsEqoMksy+JKmIrpgyhDcbM=@lists.infradead.org
X-Gm-Message-State: AFq9FYJvjhbojm3XHUrv8uWWanjIV1SQAGv78Gpjj7szit1BhK1f963U
	BsNfV33c/l/5mOx27Xq2Yj4C5VyWpmY9SMPRX3ae26s0qrVCFuD0+Id33XpdiQRH+Odj1ZQ+m/o
	RlC3Yhnh7CYAm6HzTyg+/Zr4Hh4/BbXo07lyU29hrtRlnAGU5ypziZKLXyC7xMaTx
X-Gm-Gg: AYBFou0DpgPaGt8q0AJUhoZXV2OlVLV+hV3eXD6ShQ7IIHOUSvIazfhAcwm1ZwzC8E7
	XIs6t6TfDEk2i0bVmBzeoE3Jo7RdtgJ/adalHz+vJJfTWbQOnxaur0C47sdb11yydUN0jxGyDeI
	c9zb//91HFrLD+h6QZH/0Mgt8YW0JOHCz385Uzh1WINO+D7UxQDkPp6qtshMPY7oXAo+kAhMHr/
	ptbDQj9Esu4Vk4C5L4DQdeP1SVuWoBOnV+ckdnT9WZhfv6OZNa+k0YtDCV6oO75pibY8XNExTzj
	avfpxfttap+dWaV+n4ZjZ7TvLsSDVkIxgT7DR5IXNffk4ZP2I/V/FyDHM8jlahYiX7BHoz9bsSx
	QubZXPBuid3uglsqv2/TUEGRob1L4CV+PopFi5vVkOWDrBYaI5IFw5uA=
X-Received: by 2002:a17:902:d4cd:b0:2e5:a350:34f8 with SMTP id d9443c01a7336-2e5a3503728mr21624175ad.3.1791212989862;
        Mon, 05 Oct 2026 08:09:49 -0700 (PDT)
X-Received: by 2002:a17:902:d4cd:b0:2e5:a350:34f8 with SMTP id d9443c01a7336-2e5a3503728mr21623775ad.3.1791212989310;
        Mon, 05 Oct 2026 08:09:49 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae1bfsm9130075ad.28.2026.10.05.08.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:09:48 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Dan Carpenter <error27@gmail.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jiale Yao <yaojiale02@163.com>
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20261003095913.575108-1-yaojiale02@163.com>
References: <20261003095913.575108-1-yaojiale02@163.com>
Subject: Re: [PATCH] wifi: ath12k: Reserve space for a string terminator
Message-Id: <179121298789.2358654.17588785788531487721.b4-ty@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 08:09:47 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 4qFsqZMfPlmKIsoQex2j79PnsXm_0BvR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfX0BoMPz6AkzOD
 jF1sqLH3kDjKIVUMqeFzC7xepbVld9yDzCzcKfly8JwAnFSK0NgXk5iR+vcgQ0rjbwSRIzJ5t4p
 86yIe36mMCMXAwAJwezIsMHR/xWbXSg=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac3bdbe cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oz8bYcBotx4uxxnimfgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 4qFsqZMfPlmKIsoQex2j79PnsXm_0BvR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1OSBTYWx0ZWRfXyQrPCAYoEmpY
 a0igw4v12YV38jBcGCTghnSMm56ckQRJpttfkIRfG5GOjD7tMZaPBSoDGKW8aONxBeAcE1qNjET
 Cdd5NhJQZ73Rm91XdI4toT37oYgGUxRvB+vxpMARTBUGCI4dyRgAnZZsK0zPJfE7cEoSPNxq74q
 tk5hmPBns89z3JP3sDI1MZI5kuKqXOUTFl23RVOmThw0bnOuQ/S0auAcswO/gNu1gyckobTuY3Z
 znFz24rG02TqjFaBTkyxVpgyR/foX6iB3g56noj4OoaGQuFGZjXtyz3EtyVXxSukzjbmFGPBaWL
 xLrZlMFdovN+613Q2svtGI0v6RJA4uPeFXRwz3Uyko9LbVeJpO8pQOd+CZfRCkzi6NrjCnODjNs
 DWYIvWEY69y7ZqpVEf7EmU4uNVzsSmdCoTA1LogvECqlD54/ER+nWc1+qica9X8/AxN2vvHf4EA
 T1ZtQn00+vpg6vzaaJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_080951_978662_F8698277 
X-CRM114-Status: UNSURE (   7.86  )
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


On Sat, 03 Oct 2026 17:59:13 +0800, Jiale Yao wrote:
> ath12k_write_htt_stats_type() accepts count == size, which fills the
> zero-initialized buffer without a terminating NUL. sscanf() then reads
> beyond the buffer.
> 
> Reject input that leaves no room for the trailing NUL.
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Reserve space for a string terminator
      commit: 13b15eabe2c541b80406166964cdc8ccb5e9c32a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


