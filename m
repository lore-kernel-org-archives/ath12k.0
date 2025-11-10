Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6259CCF9E3
	for <ath12k@archiver.kernel.org>; Mon, 10 Nov 2025 15:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=In2CglKkJlw2CPFhnxlidRKLUnNM/dvL9E32nfiEsvc=; b=2S3zjE1b1HOmEN5mwJu3t86H4x
	e3E03do8S0XVtwzwjSXKptmBILCZCIYzY+aJKv12ClpSxRFL27ShIa/ed9Ty6RvhoA+zcsyh9SJLS
	yf6C0hqXF82b1CwVYY9Ldg0kvrGbNcjYX2979c1mc8nECIlMPQIuvarnyogMIRCVScoYMQFYQKc0i
	puTs185BxriZ3Gns4nU2C7Ya9Zp7DQSpJCSRPbmd3Y2MP1ABTnGWyvXybwc+jf51XS0bGsXmm1tEY
	3S1hrr55At1NmdWFkImUWFetw0ci+ewqn29naFHkG93bM4mnKeM7gPVFO2IOv2vBbEqhNOmJi1BwG
	AwcFj+Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITYU-00000005f5C-2WOW;
	Mon, 10 Nov 2025 15:11:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITYP-00000005f4H-0Gu0
	for ath12k@lists.infradead.org;
	Mon, 10 Nov 2025 15:11:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA90m741927854
	for <ath12k@lists.infradead.org>; Mon, 10 Nov 2025 15:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=In2CglKkJlw2CPFhnxlidR
	KLUnNM/dvL9E32nfiEsvc=; b=bUVZEtY144oYGi0W/MZCRu7JQPhU+Uq2uG3miC
	fjBRI1LmkUY86U+n9rrdcpI4UdmDaDTqmwkKLTE9dt0h/ruymIuz8gd2iq7Y2xaZ
	qC6LW7QRhM2FK7FXnpjIHXsuvGi8t7VyedlzXwQCpE7Rsn4PFXUDElxnG4ZRP6T+
	YXQFiIpZnVYGA0kLecCCnnVjoK90jnIo5D5Ne+qmWvgbLvC6Ph1xlCuP0WMI4zkm
	K9St+U2jr4reBs3f7pNkkAUhwzfn3vT3+1zacz1iEGghDuYgdf29hSrDEGR+UZsc
	0NRTEu0k1KSrQGFNbKbHK84bIVqlNWPf1P1bdNhhqhIAjeEw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xvjd5uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Nov 2025 15:11:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a153ba0009so7112700b3a.1
        for <ath12k@lists.infradead.org>; Mon, 10 Nov 2025 07:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762787495; x=1763392295; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=In2CglKkJlw2CPFhnxlidRKLUnNM/dvL9E32nfiEsvc=;
        b=B3vjRfsjm69eYk8BoWAzsWRRXzhFv8PvVvTg1uE1QSWnYJ1Y6qMob3IZoZlTH6I4EN
         /75nRqW3F90H78WGAQ2kUvMG5bxNLTBwO62fA/DcXlCW5Kjv3Zb7FR2Dnp4joG9KPRfR
         uAI4CRWjLVKPW8Pt6cgm6/Sx36yUB18Q1iON6oc0WMIGrYd23lss8/lf5ZVwsvLJ86Gk
         /tk/XicanCa8oI1P3RS31uzHWCye2EFKniidMt+57JuFszSGLBGNZy+suPgyUfxFTBvK
         PPOVgY5dzLuj65V8Lrka3v9ip/9g9EEy/1HINHiSeQommGRfKvYjzp+hQiUvfm9R+LXh
         hELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762787495; x=1763392295;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=In2CglKkJlw2CPFhnxlidRKLUnNM/dvL9E32nfiEsvc=;
        b=WAE+P4CHI+92/B5JmW+jOfFirnO9K9PMC2UAfU8gUokuVAwT4KV/1b91rL/Xudv0bf
         WUbCy58JZSaCf4To+cZ9iEZg1+MtkS9V692U3Zyd3ARU3yTGBqof5aEOWpM+uQ+yFftx
         nwo9BaPYscYjQ/3mE5ekdPOWNL6A7rwc3b8xkaIrovE/Zv3vG198tddHU5PxwA3if84m
         WD9xrojy7SQoVQoNjIEDt16BHqOMOrubmAKMnuSkPLCAe4tKwDg1r3VvqPYodRBQhaei
         1rkbrsRjBT7xS0sFzS+QUqROCwr+c9wo0P4h2pG6/qsBpMu8j+JNrkiYaALEqedG35hq
         OJKw==
X-Forwarded-Encrypted: i=1; AJvYcCXLp+1TIH5BxflMn54GYRTjJDKh2yip6VTP7ncM7658DCOokuaP6h4mKRstC6AS+qw1+YgiRIk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPH7y4aStExS/SNkNEYNS52JKxw690AVqpW1yzCwj7l3KRpBmQ
	2YRdYPeB8U8s/xgkOTKmLWacWFvE0nu9Um6spifCOUXxxVmdw58/C9u5CBbJXHYwKnnxRJUUrYl
	gW4+jZX/EaHSoP/LA0ZsmsU01X8qV/KJNcTK2BteUY/VchIAHNo22NDT5xweU1q//
X-Gm-Gg: ASbGncsjHKly3OWBr+O8MYRnxdfreyn/vdZdrIbI+YI1FCw3NElTiWTU4G6XR4LeU5L
	t5kETjgz7hygIGHFuEUG+JdF5WYjvCIcxruUomj8V4MY5r1N4fJ66mOW2eHne2/iM9SgCrmv+Cm
	UY4gJpc7pHUoQeYrOhgaG0Jsaj3uYPGAdu+FO8amF3ZTSgSF6RF18GMFhm16EhyLDfU4wDNN1hW
	l6EBsxtwvV1zjDjEhwu55PmP2rTQL4yiZ12hy4wht1ntNpWjyX+ncEgPWdl8jS24cXpU6rdq4O5
	ZydmSxjzuCMVbruo6QPH+W5EWXK/06Pb3esjDkUVTnrHCFB/uFhjV/IiKEPv5GJHJWmm1r8K01b
	yxbDPRSpQIxOglnooV4L8P+On/ixKxt2KBtc=
X-Received: by 2002:a05:6a00:2da2:b0:7ae:fea:e928 with SMTP id d2e1a72fcca58-7b2266a4f3fmr11767572b3a.18.1762786854724;
        Mon, 10 Nov 2025 07:00:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTjgRCTxMSJ9PxX2gFFU5nHFuD65wVzXEp2yytUimmLc3aFvNbJN7pJ+c/AoWSO+a/QxJeUw==
X-Received: by 2002:a05:6a00:2da2:b0:7ae:fea:e928 with SMTP id d2e1a72fcca58-7b2266a4f3fmr11767447b3a.18.1762786853400;
        Mon, 10 Nov 2025 07:00:53 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c09cd6sm12078801b3a.23.2025.11.10.07.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 07:00:53 -0800 (PST)
Message-ID: <b7bd9e01-ac73-4630-afe4-01dc57320b05@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 07:00:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: pull-request: ath-current-20251110
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QuxTHFyd c=1 sm=1 tr=0 ts=691200a7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=33HcGjt8BaiwP3wcfBYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: NJavOTRDY9Pp2xSGCYzSLK-Bi7o-WRBr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEzMSBTYWx0ZWRfX1+5nQ9Dg4O47
 MlW5u9dKbT831cZtYazPM+ZkBTyn4qOqk+qKT0oMMzXTV7zEId4dXyKyGilr7xAhmEjB4bs+b7u
 1LhUeMrftTSAb0VP9jE9yUIEyLXfz9DlEOetoXVxFwSqeM7Hc8HO/3KvUmXOzvA+Iqh2HORGDr4
 GQCQJlIgMhKxn8ljUOTa30BLAnGeAtoqwuZuxLL5hN7ZzYahUO2ZuqKqwA/b2RbDmKG7ergxZBJ
 Q4+tVyo0+Yl/3Mz+2IwBmiDxKg2EcsSEBwYS574IbyIWmF9X6DJbgFEvDJE5tgGXZEnvqzulYpB
 Wer98y4uBluLHsoHGb+n9IsgeFZaw0ugQ9yhzVIqbHpr7uQYlok3Ch5lhw6p9Hm0KRdBG9xkwAu
 z6LlD6SNaVZh9KwfdMTzwV3f332zjg==
X-Proofpoint-GUID: NJavOTRDY9Pp2xSGCYzSLK-Bi7o-WRBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_071137_236102_F58F1D52 
X-CRM114-Status: UNSURE (   8.03  )
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

The following changes since commit 4c740c4d8bac5569c5bf5f86db65ce779178f9a2:

  Merge tag 'ath-current-20251103' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath (2025-11-05 16:18:48 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20251110

for you to fetch changes up to 9065b968752334f972e0d48e50c4463a172fc2a7:

  wifi: ath11k: zero init info->status in wmi_process_mgmt_tx_comp() (2025-11-06 07:26:21 -0800)

----------------------------------------------------------------
ath.git update for v6.18-rc6

Fix an ath11k transmit status reporting issue. This issue has always
been present, but not reported until recently.

Bringing this through the current release since there is now a
userspace entity that wants to leverage this.

----------------------------------------------------------------
Nicolas Escande (1):
      wifi: ath11k: zero init info->status in wmi_process_mgmt_tx_comp()

 drivers/net/wireless/ath/ath11k/wmi.c | 3 +++
 1 file changed, 3 insertions(+)

