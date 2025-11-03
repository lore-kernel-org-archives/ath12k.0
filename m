Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3EBCCF9F8
	for <ath12k@archiver.kernel.org>; Mon,  3 Nov 2025 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wasjlQZYxVXaUb6xZ8ZqkIpFidqoYAqCMrL/L/nKkxo=; b=WyeDdEfEGG+a5DL3RljmZHVE6Y
	L0AfE/TyMTPVI8D37n2jl2nxMmLihN4um29e03zFmXgMApzK+c2IxWVERI9ktZoBPI7D2/Ry36LSB
	30fIH7OsnrTeY4XaWUUhkbsnNYrljBztp08XzWvO7KflfSpCEmzJv9E4sT7qznWnxqtXsn+JJpriu
	xLkasoXZvg1WUZ6MKth7OhVSdhH0CzlZTj8/O3fITjhqihMjoKu4taGuBuqOJWQE1r9MdEW6PTJEo
	y+0B8RJ5vXT51B/bjPQn9CS9G8VMa9e9h0z/y1rK6C3n1f0JqL/uOFlYLe8sf1DLnIEnSeuMgvidF
	sgoVEwYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvuN-0000000A3EY-1pdj;
	Mon, 03 Nov 2025 14:51:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvuK-0000000A3Dq-33YT
	for ath12k@lists.infradead.org;
	Mon, 03 Nov 2025 14:51:46 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3B7XnV2983987
	for <ath12k@lists.infradead.org>; Mon, 3 Nov 2025 14:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wasjlQZYxVXaUb6xZ8ZqkI
	pFidqoYAqCMrL/L/nKkxo=; b=olbfNGzA6nOCNokeIvWwlLzH9IbLmY23HwbShy
	PtMZnR8Gja5xMORsECg3NdEOQY7ruFXA7KGADGB0GE4mnbBuBbFxHm+DrrQlxAZT
	vUW+84CzU6AD3AZuuTHZm8NxKc5+fOZqRqKqYEkFpKUGo90V1ZQj7RJZFrAbttr4
	uSo/5Vz+Y0+oUv58vrdB5c5ZmVKFkSxWiJCcmQ375UrAxe2jtlTPp5ZJpfoJy7OV
	8kuAHIYAJLQviLd/IiICcc7R+5OxTNt3+hylrN6884NZt3ijK8IRQtanM3f2hDRN
	tqGe21w+xOX+rIoeGJPgjgdSSMjrRMVNq61PgLlK7pez6ePA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6u8b0hj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Nov 2025 14:51:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-272b7bdf41fso53499355ad.0
        for <ath12k@lists.infradead.org>; Mon, 03 Nov 2025 06:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762181502; x=1762786302; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wasjlQZYxVXaUb6xZ8ZqkIpFidqoYAqCMrL/L/nKkxo=;
        b=IliCP5IYs0xgBUO8hHZqerJJ8ayjRCb8ccRjP64g60E7zCrLDWErKf84G1G6QTtwU7
         rYKCKeqnW3m9ErwwL3/K1JaDhRZ6A5Gsbh/lBcUzWT4OjDqVK3O317AMi563I0Sbjwlr
         YcLqfuUGn3YtzXC8mEmRnoZkzH+JEahzvE1bAxryaDIzVoIxdUEJFbQfBp4M4tWmat2L
         e/5ltybTtq8+3Y/+gNDlmg7Vf0Sd41NvvcxyXHZAwp2NIvSzHxIPHgEbHbg9ipjNUF97
         I/2FlUvIGrkYtb1nCEVcr+r62+ejkSsF0QM8ICKBiVGdl27FZRPfDaBRRfSRILGNQv3C
         /trQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762181502; x=1762786302;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wasjlQZYxVXaUb6xZ8ZqkIpFidqoYAqCMrL/L/nKkxo=;
        b=LHPKu+WZGKiZqwHJaxNI0mx4+7I0/cgzMrGCB4M8kroMi1aOhu4PZCgs3l5iktltou
         //R3rl5ufXeB35luWj1XLKChdsQx042Yekhv3pGEGh7QOGS7IDc16uSQCAG8AG0lxk5C
         knMmnDQbO533OsxJfHJVAPEPvHm4dhBt3HhG+DkXjfXxVfhpAQ2vcoL6N3DVy3Yuz2ty
         RqPq6eAjvCrMLT7TikQu9t6ZmF5MgpxnrB9+BNDswJh7sBGkXII4zsq0hZYGzSCKLca6
         Vjhg62jk08oO2q/kZeoXaDZKf8uwdfRtHxzps5ZbJTecUCCc9bktRPMjb4G3gBKw3UJG
         8O/A==
X-Gm-Message-State: AOJu0Yw3DfppfwqlegDmzXgpbE64rJcHQsx4U9IK7XFL94RSVEaluDYl
	Z6aTqPxNuJr3cIUYNOxFGvP/FDGzAd3O5nkCw9TC3++l7lUI3ZeEWfqG7TVaFHpL/l9SN9TNgw6
	oziPSXTarp0dKrRuzpaFFfrZ3eYN/Wz8UVnSjpAGFOSdcmy6gcrxFBX0cLruj2YlV
X-Gm-Gg: ASbGncse6ZUc/TxMQWMWkPuwNVIkjYo3wQZYPofKe5G3IYRNVDZueQjJTzPlLfGjh+f
	/34QLXslhFJl8exUIAyM8PzSQRFkGwCR5aWypYVTeAwii62vrPlExCvdLRebsZs+w3Uot3wqbCi
	uRiGrtcRKftTl4ghyiySO9wx1TJon48MmIT9Ghbc9sOL6MGFcP1PTg3iGjzcoFm34sFLmkK2RGJ
	dGqxUu2v9rS15TBBdbGMXRFXk3Ibu7aqbOewWeA2Nb54L7s38VjkAcIQl/6DzyBUUcrR+KGZYNI
	aHMg59bmjE2ddlTvzeuTN8JAO2iYRxhqT+GQFQ7i2jFHRh47KhBrd7z86ObZ1HFld+/McnCrxMi
	LKQAUnBhowQkkmnFXqpKihxazy+f/DXs2cNo=
X-Received: by 2002:a17:902:d483:b0:295:8da6:24b6 with SMTP id d9443c01a7336-2958da62993mr75060675ad.40.1762181501689;
        Mon, 03 Nov 2025 06:51:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4TIDTT88GxyP1jcTSD+XGLJa94lUUo0B6pbH151XMWEaRqBc8s+7rKS6QMUAdzrJW+0E41A==
X-Received: by 2002:a17:902:d483:b0:295:8da6:24b6 with SMTP id d9443c01a7336-2958da62993mr75060295ad.40.1762181501209;
        Mon, 03 Nov 2025 06:51:41 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952696f277sm122049955ad.55.2025.11.03.06.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 06:51:40 -0800 (PST)
Message-ID: <273cfb51-9057-4b72-aab3-10f088c21f52@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 06:51:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20251103
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNCBTYWx0ZWRfX7OY+fYcsSTeE
 1STWtPOI43CWFvQP72JQBRtesV+HZ3q6FafCxT5fQdMxvPBWEfTE4NdzYSodPjjYps1zQhsPrvu
 U7vlqmPz68CZ4eqViR/pzXAvN5jahsfyeBZvfc2MJsIzmCvgK99+Npm+5BFeU4MTgba4+TXqlf4
 JWsWgxXbAl/Wm4hAxyU8oaL1NNfBsVr0tCncJc3HcknaDZ80EoS3aNAU+w3uustLp5Cqirc+3V5
 0rCjELJG4JVA1OkqyS23QNcVK0iKdR7WgvOoHBnhgF9nZei0ACJR+W2uyvfV/zat3R+/N9lMeFw
 KwFAIwkW6zQd5TrM9hLiKbEsEvQdaE0cB8Jxq0mjhsYpbm+EGzJpVo8uJkh0YzkZM6Jb/AyPWUM
 55ZiI3pCgwgImRwDzf6WAj0YkEY0bw==
X-Proofpoint-GUID: n5agPMtIqJ4DtKyo-dkuRSC_-hXZaYq5
X-Authority-Analysis: v=2.4 cv=Ha8ZjyE8 c=1 sm=1 tr=0 ts=6908c17e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=X6h9MiuBSSvgxfhAhMwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: n5agPMtIqJ4DtKyo-dkuRSC_-hXZaYq5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_065144_885717_7253E8D9 
X-CRM114-Status: UNSURE (   5.55  )
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

The following changes since commit fbc1cc6973099f45e4c30b86f12b4435c7cb7d24:

  wifi: mac80211: use wiphy_hrtimer_work for csa.switch_work (2025-10-28 14:56:42 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20251103

for you to fetch changes up to 9222582ec524707fbb9d076febead5b6a07611ed:

  Revert "wifi: ath12k: Fix missing station power save configuration" (2025-10-29 08:12:14 -0700)

----------------------------------------------------------------
ath.git update for v6.18-rc5

Revert an ath12k change which resulted in a significance performance
impact on WCN7850.

----------------------------------------------------------------
Miaoqing Pan (1):
      Revert "wifi: ath12k: Fix missing station power save configuration"

 drivers/net/wireless/ath/ath12k/mac.c | 122 +++++++++++++++-------------------
 1 file changed, 55 insertions(+), 67 deletions(-)

