Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F4BC77B7C
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 18:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+wy8FW0+jFScerUnGQmFY4VIpRHcERfP3YQyx6WH9o=; b=4eAGh3oHwXdZNWIoOJRl6itjP6
	7ZroxfJM4mQCp3o1OoVyoyVx/neyoSX44G+OYv0FsR6B38aF9V4ca6NJWv7s9apr97rLtvIzTJRrs
	PRKQLEgAm3bEKVEhHdvWKIYOcb5ZltcLngoV1DfK0sX5ZEWD0dgwwwUiv8lxwa1Ewah4t3VACZuKB
	I5Zsx/QKsd3GmPYtnpVLNzGSQwijyLtfXeQgmBDU7Ie5EIkoSyxsgMtJ6eY+JCbSuYH71SrurEejc
	xawg8eOUp8FjfH5PCZ7goi3qq3cTxtgZPHkCZCrjkCAfk4j3VYzrGdg0w9emU/zxRsTxXLK4Byv9L
	y5WVtcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlzl-00000003hJz-3o4p;
	Mon, 23 Jun 2025 18:34:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiTb-000000036zv-1huK
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 14:48:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9kXsC014510
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/+wy8FW0+jFScerUnGQmFY4VIpRHcERfP3YQyx6WH9o=; b=aNQqtrWdE3WUeJuJ
	mYDY0EGSgfxgw8VV7dIxlKO9aomCUVfsxoywG2vOjhNHsvz+xZtXJaXpowhJcc56
	PAo4A9kAyQKTDtKaBGjFCLkkJ3bxCclmdnaZyg6fE5n+6LyeOYPsxqRj9Fvmib3R
	gIGhYwDMjVvm3MNfZ2rvx603vf27T8oTzwA3klaKiz0VdkkUd5OQ3cnCe+Dxs80B
	WoW4VphkqQGTD2J6dqAFtoGX5GRv425q4rBvomSvdZ4mYrrCiyID3rWrw7wV2/15
	y27iKDRxmN+mKOuNqC9HzI4xSMvRpdXpI2sf2ec1SbJQZyia/vyh4pr3Re3E3s5a
	VtqBTg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5j4pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748cf01de06so6158294b3a.3
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 07:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690130; x=1751294930;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+wy8FW0+jFScerUnGQmFY4VIpRHcERfP3YQyx6WH9o=;
        b=R38AK9tVcgGWrjkcwKbcwZiWPkFD8Tmj07pNKTVPQL9y2TcUZtOviLjuqRPK19KwUk
         DEUPusj2qc4mPzJJ/yQYRXT4I7mdeXrjoizxBS6PuqqBcuniTwN44kskBd05Y7h9DD+s
         f9KaDD5sbPXfWHY6uwhYYZk3BMfRitAPHPFdtlgxvjzE/FpmCO/lz72JIwwKGv0HQF6r
         2ePeENyo4I9VDGjregZPK195l0JBJW0zv1JbmdyLdDq7+IYRW1I0NSAldlYzYAslZgJG
         vozfmtyCNdnTm75bF+J2tIVmL1rLFikyTiIOFgBkmnEn1reP/VT0QRiSh6AdvsQ33bf2
         NQDQ==
X-Gm-Message-State: AOJu0Yy3mh6tMkFVTbCsFnXurGTYJqOyT9OtxU0PuTPE63imNSETAvGn
	SMQjN9D+NZPkpA0IDT7rHH1NMpjz/EBdXk3k/s4tpV2Kd9Ulh1FDTER0NH29C18DnP0FAMZBMKp
	ibnRHY3nHT1XiY1/ZLI0nZVMweP++bToXv5HBAuO8rXgzPurbFxDnK6b0fOF4vhiN14jta+hx
X-Gm-Gg: ASbGncs72O7TPnBCtngJtH1Mre4oMaXraCBuPJomzM3eTu3W0RW16Jc1wnPPntcOrGP
	JW2la63h4TBp7jcZ0mVjBNQj3egpSg0WO9VlJxfubpYKJl0xWL2ME8VmG1JaMyRw+ewyKidt2yb
	z8N578pu6CcxXmu3Dd/m8c/JVBVW2huJXcLEudhrWLfVOAeXbg/a00nK+Q1eL2tCACUiSQPQx+R
	j0cirz4oGbkGf9jiBlJBJURsztkF3nEJiVvn1RKQewilJbicw5gtlj52ZLVRgrvfXUsTuGoW9Jk
	9o4JPk3qx/lGNnqDClaPWj/S5C89eZzetBJilFkvWeF4HUHy/XpO9URNVP4=
X-Received: by 2002:a05:6a00:23c7:b0:749:472:d3a7 with SMTP id d2e1a72fcca58-7490d9b9329mr19309175b3a.18.1750690129934;
        Mon, 23 Jun 2025 07:48:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGchTUzWsFzP7mgaI9GATxWd+ea784s0Aqw/P6sDKIaIjTTCJiTSXjvOes1TUnAIzahnPY5uA==
X-Received: by 2002:a05:6a00:23c7:b0:749:472:d3a7 with SMTP id d2e1a72fcca58-7490d9b9329mr19309146b3a.18.1750690129538;
        Mon, 23 Jun 2025 07:48:49 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:49 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, P Praneesh <praneesh.p@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250603103542.1164713-1-praneesh.p@oss.qualcomm.com>
References: <20250603103542.1164713-1-praneesh.p@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v3] wifi: ath12k: Fix double budget decrement
 while reaping monitor ring
Message-Id: <175069012887.3758471.17282538397999046159.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:48 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: Qyh-0zn76put25mJJ-l10CFl7Hdu6FkW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfX3x1XbftGPnRg
 YAHRfhQG/NF8aKmszGzqOvaUstbsjvpQRMMnZykLIVMoiGbNoxeYmCYBXtovKSKAogtNTf0MD2v
 Mncobp8B92jiKGGcexd8JDPFMawjv1nN8xVgHFiy4g3b9e75SaZWFi/JpVeJ897czMyXLA4npCX
 E039jTqTC20OJhW7eb1KIWru1wo5El2lPhvtOpzFIxi2rlK+NEv9weliA8jt2uckFBsvJ5a8tNW
 feOLEZxy9PbkCEeAsQZ9kUlGTqQYC30vvKpzHoB6RwWOGCfSJNDaq6ZMRnkRrlQaoja2C4P24/L
 mQews+WlyZNW7PAYtC06tvf7LD+SQM4o0TceeIWx712ek+KVf0gY3UDpHBn6r00aeithL56RCwY
 yEfMp9lfC985iVZ92zmWnyy3SUPw9PjkuoNnvaKXGPjjfEPN+H5DEtPHsjfLrht17KlZfgX6
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=68596952 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=f0_862vhOG2d2rrTCbkA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Qyh-0zn76put25mJJ-l10CFl7Hdu6FkW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=902 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074851_452600_AEFEE22E 
X-CRM114-Status: GOOD (  10.12  )
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


On Tue, 03 Jun 2025 16:05:42 +0530, P Praneesh wrote:
> Currently, the budget for monitor ring is reduced during each ring entry
> reaping and again when the end reason is HAL_MON_END_OF_PPDU, leading to
> inefficient budget use. The below mentioned commit intended to decrement
> the budget only for HAL_MON_END_OF_PPDU but did not remove the other
> decrement. Fix this by eliminating the budget decrement for each ring entry
> reaping, ensuring the driver always reaps one full PPDU worth of entries
> from the monitor destination ring.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix double budget decrement while reaping monitor ring
      commit: 54c350055b1da2767f18a49c11e4fcc42cf33ff8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


