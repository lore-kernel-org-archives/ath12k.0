Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D66C43602
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 21:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+mwtC1L5sg6q+kGYSALMcZvqv0AV+JnPkL9QpIhxjE=; b=q1LzthwiLZu2rSbUWeyZe6Y+zV
	sNc1a1W04PllO3JOQTFs5OSkcPsRnENhQjm12m51OZKdH9svgN7kvnbdXnebWIhGPldQQ5oFyGO+0
	6by+GwI4e71l/zWdE3PqluYGMCwz28jeKbr+MEvZqm9h8hUHPrqOdoEdnmEt8yDC6lGjt5MMTwPcg
	1DzHGF4Uadscr3IV2bu/Ts1Z43yUK90lvVQgSjrq7ll5Sl8s99Z/OjrpFfcpj1vJXefsis/x5pafB
	IGZD0T3dgaR5D5ltgvbHU/SHvq4q+qXf8HplQDmqVxczQKFvIsG3BlfMZ6cJwO6CC7m1XuHpNd6Cm
	liL/Bz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefz9-00000000F9q-0SbA;
	Tue, 30 Jun 2026 21:27:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyf-00000000Eso-0nvQ
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 21:26:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDaFA2948486
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+mwtC1L5sg6q+kGYSALMcZvqv0AV+JnPkL9QpIhxjE=; b=Hc7NPkJNW/2U/6J6
	EjXBgA1FYkTJttsFdzZbZgmJMdSQfklaQZYlfK7rpDzT9j0U0tXXMDIa6+M0YZ/M
	eSYL2k+yGYeItWrCX4U2t++HGvmzwK3d6P7rBnbp4RpV0q4e0UkNdQVW5eUxM0Yw
	cN41oDP8faINJZnZ2c4LyfQ7r40FWhlQIuIKtghHdMFot9Nn6LC+vVqV+ZbutrbM
	UFNqinoxJJf/A9yYb9D+v0o3SFNWFBOa5HAT+g532m+YJ3M+hybZcTyqvx5PLScL
	sJv/ymSQAHJOwu4er5hoFx8YmlMUtverBkN/UIq34vlP60JfT7VAKmrKkIwJqfa+
	ud8EEg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw0k1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30cb5001ed8so348332eec.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 14:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782854804; x=1783459604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+mwtC1L5sg6q+kGYSALMcZvqv0AV+JnPkL9QpIhxjE=;
        b=h52cvGxepPfgoKKUwbJyopApE0e+LWimm6tCGTrIVNKTtQO5RuUJcXV8lifn0b/gQG
         qzJfN327F0LACAJpHjxqpnlJBYbtOChgX/qrbrvvF3s/7IXswFs/zcdAgIMGKHoh5ZjL
         Q66TE/C0SqJ0/zRegRbagWnw5ydAQpv88WBI877jE5DmHGO+yFhjrtTNre41TI1T8wzu
         Jbb9FfW+iYE/UrcL6/c/mcN2hIs5+rE312iDlmZNUy7RCknCqjQexdsWxhFcymMfEzbZ
         qxIAuV0tztTlmGs59o0HpJS8Lntb8GbDfW0ccZYl0oZ7oSCR9PbDQFdpsXJZpAaYj6/N
         Ohww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854804; x=1783459604;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z+mwtC1L5sg6q+kGYSALMcZvqv0AV+JnPkL9QpIhxjE=;
        b=iC0VdZSLvaPq334kaZ4J6cB8ziycOKttHMsT/TOraxegXa/oUtPUe6kPzWRCruzm2W
         K9Xhlo5Oqs8dyU4ylaott95OVwiC63MASat1H9ht+V5SAMb1tab1QwFsYxXdHCguo22T
         UzDc2jcQh/YF6JvBryjAZLKolfUJFSrkEMDFVLrGom2u2GVPPKCptcShBmsNziaK4kzw
         9iz5YBhIFiWim5rM+IGJoyMwLqu2pAqC54tYVKKA79+Myn+hibv+eFnwoIjZFVf3eeGb
         k1iPIIlptsG2vwD99N4LB6+kUuQhkgd9wwU72N9bWjfqaqZmkVfSrvORVRjJoUqOhUa2
         7++Q==
X-Gm-Message-State: AOJu0YzsNm8sWifLM5jvLpLf0NJLHHSUWBiE5Xs3D/tdcgsBGKwj3FuM
	MHsASNZaVPq2/igEgb8QWq816HNAQk1h6hYFXzHA8CMrqUqkcOFKAxAK2/Fs9HTzTTVOJJlVn0h
	YcQpmJJHDhWorRxd+CbpRXy8tWnMtZPKBUAC7KP6rsCL01ipdiQLR+cyx8TvjI/kon8wg1BP9
X-Gm-Gg: AfdE7cm4ATOz0PiFcMUSYaRStS1geicyUK8lOzD32Skhtyt9TK+SSw26WRzkpeR5iZr
	eHr8Y2CPAhMRIB2ECBIiZmHjjMOLig/UGb8N9NGuyodVuqb/FSXF9zW5GA0Hf3alfLfweTXhYlb
	HuD6L9BbpZrHQgN7IZVmaFLxmlO9Xzdo4hbUGW30EaKmbF2ORtqNwxStxbJUBVY27WZ7L47raFB
	L9QchWS67yGrVrXSa/GAHs/ZC3BaV3R38qXiV8g16z6GfuDM4HaazzYTDn5XqKw1qozsKm/t0Hz
	0wparXERk8RO5RM/Tjv0GyUqfbefmIeprOsOihd9ibEigU5SxrpdVRdM7h57LPnUTi9jHJ85JzM
	FKKDBEuw18pAxXPwOMB0X2Y++8a+iQCLxNxmzVeuDQHDqdeppmL8Xazvw9c3XNJreyg==
X-Received: by 2002:a05:7300:6405:b0:30e:ec9b:7c52 with SMTP id 5a478bee46e88-30ef0a3f2f8mr1789507eec.40.1782854804095;
        Tue, 30 Jun 2026 14:26:44 -0700 (PDT)
X-Received: by 2002:a05:7300:6405:b0:30e:ec9b:7c52 with SMTP id 5a478bee46e88-30ef0a3f2f8mr1789483eec.40.1782854803563;
        Tue, 30 Jun 2026 14:26:43 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300b286sm11604046eec.12.2026.06.30.14.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:26:42 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Yingying Tang <yingying.tang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
In-Reply-To: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
Message-Id: <178285480233.1590147.16424453054668146902.b4-ty@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:26:42 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a443494 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7Sa7iVnaTNRCtE9djW8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 7GgGYBIP4YrCqx3RgpqtiJa5UkLtC0ZK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX6LC/KNvvr32r
 bMAYjKgFhllWfZxSnvIFtoh7lAjlWPPA2G07AeAIf92ZHoNNYApfmAD5yS0vmkYgNyabrM4AYov
 LyvXSmjab5ELBGIN2IDmEQk7olXerLc=
X-Proofpoint-GUID: 7GgGYBIP4YrCqx3RgpqtiJa5UkLtC0ZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX3lxs5R5zn4a6
 or8wIG1TvwEhhYXhb5c1Vd1DMcdebHAV3B1tMKlurO9Su+tCkcFoFmqeYpLBWKj9IdFAs01WgKl
 S3mOOUp9ek0hjqmRbsUlwkGwRR2TM2cQWM6/aJ9PvKf9VYzfjntfdLZwp2uBAZ0PAZr5JGzHLy9
 LQb1ocLO7aWKXIXdGqtQ7ujdLN0xXS4i7M9TUKNCe1TtSZ44tYZIxt+alJgUnczLQGgYqc5tGoK
 Xm6OplxYT+E8HBXNdyF7RwbAuOwfa9iJZRMslshgPKGhZ0XIW1PppWDMnqeLhCwCoR4+u7R+Yzy
 RQgI9joMeSc/5VRpijpKMfRNJ4eR8nFCVKh7tC/WjeDdW0rTIyjUSUwcbPCVxyvhoz+o4NCu+Ic
 MYIozsHIXFU0ql6saFo5YmJxiJkn9neU2x5DfO0wNKPM7uMADtqen20MtvVlHHY7Mhy3WWdUVWN
 DRo5tWFyY5n5Te3oT6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_142645_968278_12B9D800 
X-CRM114-Status: UNSURE (   9.48  )
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


On Tue, 09 Jun 2026 20:13:58 -0700, Yingying Tang wrote:
> For WCN7850, MAC buffer ring size is updated to 2048 in
> 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
> to increase peak throughput.
> 
> But during the RX process, a phenomenon can still be observed where
> the throughput drops by about 30% from its peak value and then recovers,
> and this behavior repeats during RX.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: change MAC buffer ring size to 4096
      commit: 58aeb412495ada7fe5495c7805504d7cf1d45453

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


