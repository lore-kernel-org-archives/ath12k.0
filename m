Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C740CCD185
	for <ath12k@archiver.kernel.org>; Wed, 15 Oct 2025 23:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShtTC1WEMet9WQjtfiAHqjmC5GBi+F6hbueOGEjlF7Q=; b=rZ3A+cFzd3pEF0a1jRVvMW3aME
	ypgLuNhWIH8OftI3DbgbfP+J5A2NjLG2Wyl5BLTKwYM5Bi/nsMwXENSSEQTIKX3E/4qRSO1jWeEpM
	vANlo8RGp824dy4KLTK8EI6GvaRgEW+z1HpElMBOPX7eLwNQffCEQ+ksfiew5xLBtLO+1Z/wkJ7kV
	+u9MGk0HxJWlRvIvz9giv1HKu7sy8vPpu5KTjU6Dvud6luICWrfkqK3bPk+PwplAvNCxGNN9VoVg3
	rj15EEMMBbXBOxpS15rHZ/CCI3sbEH1TzMNXTkoDePUcb7YJ4ML6mVNUIacbQilIayEIHCglhNv+a
	kXcYAq9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B6f-000000035jD-3u3G;
	Wed, 15 Oct 2025 23:40:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B6d-000000035gM-1R6f
	for ath12k@lists.infradead.org;
	Wed, 15 Oct 2025 23:40:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FIPgjk015803
	for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 23:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ShtTC1WEMet9WQjtfiAHqjmC5GBi+F6hbueOGEjlF7Q=; b=FUbhen2hqdH0nPM0
	Y3zUk1tlfrnLCXbYo9jlGzMdh8eytpZrO+eS3WnwNHFtg/1rDTnF6r7aKcwFGo7Y
	9hKqnvCIOpy3FaircoE/QMGBHZsnnLICUrbEHt2oxIEuV0OxDQNh2XP4Lu5zJdrb
	W3ZTlMVlv7NYe0adlh/gJHxbB3490xLoAwo9LgUuevleSA2or4BbQj9wJCCml0jx
	toZ4T8V8zeWOldEyDjkLHgOaaUXilShyNsCRAIsb1kQEZ91LTHZEtFSt0/Jfmnft
	t8YXRjPfT9MVStZyiq7Sr8uiuKmvPqfqftmhOod5KLoeCYr0woi+I0ObsmfKmjc6
	vvKmKQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5pd23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 23:40:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-27eca7298d9so3429365ad.0
        for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 16:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760571629; x=1761176429;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShtTC1WEMet9WQjtfiAHqjmC5GBi+F6hbueOGEjlF7Q=;
        b=LnLI5iz1pPJMuO+g7m2hnMEmPNtZIrX3r/7iTGlT0Zm955m+LSgKJxEC+n783ndZv+
         Hj4NrLKiafruOqG5acgzEtMiqRNlkGqECvzhUlFoQhiLuY4rkQaz3WPlc03yggm2Mq0K
         JU2SwRlr2OC2bR1hOCUUCKupTc8LVG88Q/fFSkmLp0YhsiIS/E4WC93NkeZCYj4zNkWB
         Z/jhiUL6dTRu2XqILdbJryi2d0qawFW6AAIguYqc91MjAZfzjwA7zkdlfKcWlEoqvhff
         VobjXxVJRi2SFrONjNymipOJKSXRVC/pIRXiPoy5fCzlD94k/+yxYz69ahMUBCZJkgMO
         lyyg==
X-Gm-Message-State: AOJu0YwC5P5Mjwmp1HoioWef7AG8xYljRKwSFaZVBJeaiHr2e8yxyRm1
	txDQ9rYZs6dQx0nvSvgO0c1fDU1cc7KAAMx9Ut/VdvnFmA3P/tGJr887mCP1idAUr6FYOTTCYYx
	4HVu47HIXhVJ2SSnix4xbZXABASec8ejvRZP3jLNME7nQVc8mmv890fzM9acoJctD
X-Gm-Gg: ASbGnctMEKby6czfe6L0iGUCuMjpCbdi3Q+3Q/uIbJUe3VUcL2ogZ8GhL7eZ6Xtt5Fq
	qfWfbD1J2GoIpsUVn5+k73rX2VmWM/nj1FwYK8rYd35MSTs5kBXIdmw5ViN/imWfoTTJjnD9cPn
	XnpITGRCfzePiQEZt5QClosBJj7ARGU0gGur3hzm8M+OhUn79aqE/LIsZQ/YkVpcQWfPcmFMVF/
	fbM2TeVijcSpp+i6/e3+PiCxMZKOtuu3jtdfxBMk+i1Brh7f3aGy6ymiL98JapEEIY26L19y541
	j0gEgS8k9DdWjRmiaGChkEZEZK+NwzoOdnEK8VPJ2XvdOvEUCkRbhvWP7Kfr+rUfdy/9ckOp8rg
	p+AUzGCwbgCPwBOdAQ7ea1ZK67pqmPC2hLHg=
X-Received: by 2002:a17:903:2408:b0:261:cb35:5a08 with SMTP id d9443c01a7336-290273ecaebmr401810595ad.38.1760571629176;
        Wed, 15 Oct 2025 16:40:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzZxRJ3FcQQbcnBoCwaKMzl+iyWy2m+UrDUEwwXj1RDq/2Nib22rtN2jAco9VOj3HriTFs6Q==
X-Received: by 2002:a17:903:2408:b0:261:cb35:5a08 with SMTP id d9443c01a7336-290273ecaebmr401810425ad.38.1760571628739;
        Wed, 15 Oct 2025 16:40:28 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7c255sm8055635ad.70.2025.10.15.16.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 16:40:28 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Sarika Sharma <sarika.sharma@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250930091551.3305312-1-sarika.sharma@oss.qualcomm.com>
References: <20250930091551.3305312-1-sarika.sharma@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Improve RX Error Handling
 and Debug Visibility
Message-Id: <176057162811.260563.14871578473723294347.b4-ty@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 16:40:28 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: JAB16jmyhK867JcxbVQHK89OUJh2tBpP
X-Proofpoint-ORIG-GUID: JAB16jmyhK867JcxbVQHK89OUJh2tBpP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX61xqP13qW1/f
 VTgKGf28wV/TlwBlU5ZkwI1/h8bYTd/v+tziTna6Z6VqKDR1AMYxCCJi4RDYgZ3ytXwVH0XCzU3
 bAEuJLolSnjN9AwhWG0AVZ7Oqw40sImNBr9mDgghTUpI/2ldR7GFvocXlXR5uw/IemL30iq4Zpe
 2Vh+7bd1Br+XEyOD4k/9qZ+MiGfCDg1R3vP6ri0AIA0X2RUF9IUwKhpolVbri0CffSy+Qv+CxX2
 TLwd1pVzuKRtl205VAyLnk6TobomCIx+ylMGfTC/yLsGDjfyJbsTDSh2snWVg7pC69zefitGlgj
 nLFtggouAhtdYdZOgrs3Vp5X7QNY9fZ1NZA04M2dYYN7jDtFpTHoJgZnZdU8U0wFBDMDQAyI/pr
 Eg5pa0Y1rnik2h5jorTNpxckGfLssQ==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f030ee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=H-2_zFce71BIRk9qqjMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_164031_505492_31272B4D 
X-CRM114-Status: UNSURE (   8.95  )
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


On Tue, 30 Sep 2025 14:45:49 +0530, Sarika Sharma wrote:
> Fix buffer leak and potential crash in RX error path. Drop MSDU
> buffer-type packets received on the REO exception ring from
> unassociated peers, as they are not parsed but their buffers are not
> freed. Add debug counter reo_excep_msdu_buf_type in
> ath12k_debugfs_dump_device_dp_stats() to track dropped packets
> and aid debugging.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Fix MSDU buffer types handling in RX error path
      commit: 36f9edbb9d0fc36c865c74f3c1ad8e1261ad3981
[2/2] wifi: ath12k: track dropped MSDU buffer type packets in REO exception ring
      commit: 43ba986e7ac7d9420e26e9a9b03c73054bc2149c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


