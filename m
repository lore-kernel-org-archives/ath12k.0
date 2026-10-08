Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C11CA600B
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 10:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xVCDWLiiMItKUZiCtUFGlBB/YQoEb2xnk1shkVtbMg=; b=N4jBI3Q7JMHaynhaxYzC/lPs9A
	zArwU11aLcE4Yf/gZI471iRWfUCLOs5T9Q2poN6cVGAkMBlE0zQeFQwbP/zX4l7kosBVTosd2ReB3
	I6yaAjuxIaaRNkNu54WpLJI1H2wky463fFRM0+6TLVnqGMUF+JbHUDTKGLWVFTBxMG9hkekIOkVXd
	KnfRFnrlDcvyzj5hO1hZg1zfUqcioWMibc5HFFT2gRwKuCxkAwSALNHEKp2FPeixl++ZQJYeu7MvK
	NscGPaYD1ZeExbciaSJf5do6OIjPa6TWz1rLLIX1fEaE8lezqIlc2PCxyff6cWMBHj/6lJMO32WpJ
	dJ6wZehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElJK-000000046ni-3X8O;
	Thu, 08 Oct 2026 10:25:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElJJ-000000046mA-2kH1
	for ath12k@bombadil.infradead.org;
	Thu, 08 Oct 2026 10:25:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7xVCDWLiiMItKUZiCtUFGlBB/YQoEb2xnk1shkVtbMg=; b=e/SzPIBw5rwjuItb6ZISm3h9Oe
	Dxj++6kb8AIGGf9IUL3/1qRxe30QkMhau/E1fJaZzPFNOmkqZa7DG1qgnD4Fx27wpaSoGEPtBT7IR
	/Exmvt7bvfZbLAR5UZa8TYQ7zsRwU3h/3K/eGL6nNjh0JpI3emShtNxELY+2N6N781hcxMAnGc3DS
	n5oZdIqBub3nhYHz2Yej5rE6OQKValkY5kefQLl54Qo1xFXs40CIZkZAi3PF5tNto1PBOq2COYfds
	W75Qcr4TjvMbFV6v+1bYMwBf1jlKHmMRFnpV0H4UTky5nZKvTP6rMMX80YWf0U56ey6T1vIizt2i8
	WacF8jDA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xElJE-0000000AHnA-1YTp
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 10:25:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KXNR1170006
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 10:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7xVCDWLiiMItKUZiCtUFGlBB/YQoEb2xnk1shkVtbMg=; b=Nuvu7ogDTcb1zFQE
	k+ud1qo6djy+BXYse8A60mBMyZQgiaH/NUGsUKNtlE6gAgPEScbnHcuiTP7gyY5F
	rDvW2FTDShJl2LjH6jW+zSJ3m4AgOFAdHPGURKNvgaY63hkYmom2yW9EhqmbgTxG
	Tu6vetR6fOxF5OjQXSeZKXFWnt/HOhbLA+/L6nmLolsS4jDRH4N1VergeCSxzK5y
	AF7xplRno9kNEkJQ1xY+byV+Z/GgBy/K1kQbmPk/Ioyw4v3FyqB9+MIPr4nO2bB1
	iUY0U3N2svAcHLvPjZMhqz2GU9PqzbeyX8cOJ1dMj62JK4hCEKIvLHdFQC7Lbpo1
	Jm4DxA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3adqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 10:25:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df8484f12cso54364455ad.3
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 03:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455104; x=1792059904; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7xVCDWLiiMItKUZiCtUFGlBB/YQoEb2xnk1shkVtbMg=;
        b=IpLjDbim1XGFEoVyBVhmgJoTF+08NWoc323Nfs6ZAr5RAcnnigDAxkGLvUqaQ0dwjw
         pH9hqfF+0vIemnnYmnqNEIyy2NZdgt6OEFgkA/LU3TRl2VNKU/8o+SB0/EKqDte45XCR
         REVOwjzZNbwNepjrmEdoAGHSmv8CriZAcHsiBnsUffCK1Jm5e/BG9GOkgny30qN8uA37
         5kECvYDER+5ZT58DA95EiU58f0MGy1NVFyOT1KkY4M2afoQpV7Tgb9dWFtFJIEfLkhMY
         TAiUc32KeLvZNje0cNRs1XcdNJYTmjeN33IxCzCCk5kwJh0vBph/VIZAIO40lFqU6D72
         4pkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455104; x=1792059904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7xVCDWLiiMItKUZiCtUFGlBB/YQoEb2xnk1shkVtbMg=;
        b=xIEOjje0Jfh60Ct6pVbHFkRq2pnvEao62f8cckZf+D3MP3kdxcD472nKJhuWqASk4y
         AyDIZ36PDqJTiG1dIm+RDeFwKQG9l6j1Syf2d8DGuGJtooWqgLqrs3RvmiZM9vOod5W7
         DxW0XgpND/U2EgxO51znjWVi8BR1N/WBVTkhdp+SBs23/4YJLV0pnemiZ2MYLn+hdynr
         bKYvEyXjyzlS12KoxmP2cnjIjWIGzIi49EY4Hc53owYh4Ztk0khXyKrTuJ5xCvkLm59m
         hFmngih3KUzidzutMq8giBuWfFN9a5pWlt+8Y0FIdjDTyZhhfLSMXwmAHrGGA2cUwUGr
         NdMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbHNz+1a/ZKOaqelkVECdt/HVWlq1t9H3fbbYe9/4+bQJbP4YpadopIWLZuTKgSuJERqL+qqw=@lists.infradead.org
X-Gm-Message-State: AFq9FYKPLLDfuW4/vS2TkTNs+zexfFU5AEQOvONB1+TNN5uyAKmD4k0C
	MlcdwOKnhOYosMbL++lbaygx8AgUJrcaRxQPr9XC1IylAYpDkPsjW4ONWcGHZ/vFeh1Q9nkUa3D
	Aj29pa1aZSPrHGe4odcd7v74ULdFZH/83eN0LvU4l52Qq5kKrxPEkUv4NP3rd1U+H
X-Gm-Gg: AYBFou0A09JQJwvQftX8AUde2MQ8S5Udoot+3D3qw0oQrWPcB+a1BJF+Uv0GEdTcmyP
	F0PgJ+urDU2+brFQWA5XyM9iRNz+C9sReNvE5T34RtcgCAPW3sFAkpTM4gARRr/eO8RdGq97jt1
	55Xf2tNWBxkWABaD2s9ijO1R6IX2QxcoTEon1B02i48RADOzGJQxmR3A0AvF5BU9FOSwmuggmit
	CNW4nNwdC7MOqcwefPozvwjNk7wFBnrojDgJv4AbxAso8BftDFdLr8tzEgLSHh8Kr7yHXmnZ4c7
	NcObyZxSd+4G04ntswdiNZ6SvQm4I3kHNjyaoiskwy0AoD06HK1IvUauWt/w8O2uUw1/Lpyu9UJ
	0CaS7bB4CjgHOH/eM+V3couN7UedWo68vIJpYlRJ0J1d7dke5t05PWCimFLcmw+Mm2MKwZfd5ia
	wCYsa6HuSVKi8DeIXW5fMXWQ==
X-Received: by 2002:a17:903:120c:b0:2df:8d6a:3548 with SMTP id d9443c01a7336-2e6004f13f9mr42323535ad.48.1791455103880;
        Thu, 08 Oct 2026 03:25:03 -0700 (PDT)
X-Received: by 2002:a17:903:120c:b0:2df:8d6a:3548 with SMTP id d9443c01a7336-2e6004f13f9mr42322735ad.48.1791455101822;
        Thu, 08 Oct 2026 03:25:01 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:25:01 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:07 +0530
Subject: [PATCH ath-next 11/17] wifi: ath12k: Add platform MSI support for
 CE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-11-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: M_-kRG3l9avYkaacccwDdPX0qXNpluGh
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac76f81 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7KuP-4A2zxPpKnieA6EA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX6rldVrVPe/13
 /cRA3m3lvtrkXUujlytEDxj/YyMMXkmO3I+jzA68YnGNVHAeBuRQ/LKGm2wdz8AdZ+z43a2xtXW
 fkYQUAy78W6HO47mOHFvxQ5hEJFt+84=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX0u8JSHj19qnj
 Whkg0mrLgy6E5EFQSI+Dp2U2PaX0Vce8fmNVdl3MTz/bRZpBuGdikrRS/9iMYhJcgk+eSSAt8f0
 4bW1LMVXEm6P4zNr0TlCuM7hjM4WpVCuY9wN1aW7FKlfzJT8danXI9I1ihIgAkGk3EhT8zQiPEo
 hKaLlmB8upE7ufnUKcVVWGGTi02S9u6alEtmnbDt/mX+6kSFqhonLNQnNTAVL+eGumcmU9Tw+NI
 8iLHzvie/9CSMSLoYsHRyfNl9c8uY0qf8luvZd07pbV0mQ0V20CWI/U7I/wytBL8Y5uUdxpGGhq
 UPeRrqq2FhDDkf670+qON3t4ezzM4r/b4wskmE0+bhR8EbLgdB65AKy8EjCR0ysRtEojTTwX7mh
 IfsWkakGASrIGABlS+zUu+D5kuWrEuGuV+tSLqewurmQkGBLMvicGwL6hlr6CTmkJfnHSZ6o0kg
 mscBUzcVXk2BY3UEVJg==
X-Proofpoint-ORIG-GUID: M_-kRG3l9avYkaacccwDdPX0qXNpluGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_112509_833489_E1609E71 
X-CRM114-Status: GOOD (  26.40  )
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

QCN6432 is attached through AHB but provides Copy Engine (CE) interrupts
using platform MSI vectors instead of dedicated platform IRQ lines. The
existing ath12k AHB interrupt setup only requests named CE IRQs from
the platform and therefore cannot configure CE interrupts on QCN6432.

Add support for configuring CE interrupts through platform MSI on
hybrid AHB devices. Introduce an IPCI MSI configuration for these
platforms, allocate MSI vectors from the platform MSI domain, and
register CE interrupt handlers using the allocated vectors.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Co-developed-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c  |  14 +++
 drivers/net/wireless/ath/ath12k/ce.h   |   4 +
 drivers/net/wireless/ath/ath12k/core.h |   7 ++
 drivers/net/wireless/ath/ath12k/pci.c  |   9 ++
 drivers/net/wireless/ath/ath12k/pcic.c | 155 +++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/pcic.h |   2 +
 6 files changed, 191 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index b23a0e9dbf61..78367126f49f 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -550,6 +550,16 @@ static void ath12k_ahb_init_qmi_ce_config(struct ath12k_base *ab)
 	ab->qmi.service_ins_id = ab->hw_params->qmi_service_ins_id;
 }
 
+static void ath12k_ahb_disable_irq(struct ath12k_base *ab)
+{
+	if (ab->hw_params->hybrid_bus_type) {
+		ath12k_pcic_free_irq(ab);
+		return;
+	}
+
+	ath12k_ahb_ce_irqs_disable(ab);
+}
+
 static void ath12k_ahb_ce_workqueue(struct work_struct *work)
 {
 	struct ath12k_ce_pipe *ce_pipe = from_work(ce_pipe, work, intr_wq);
@@ -690,6 +700,9 @@ static int ath12k_ahb_config_irq(struct ath12k_base *ab)
 	int irq, irq_idx, i;
 	int ret;
 
+	if (ab->hw_params->hybrid_bus_type)
+		return ath12k_pcic_config_irq(ab);
+
 	/* Configure CE irqs */
 	for (i = 0; i < ab->hw_params->ce_count; i++) {
 		struct ath12k_ce_pipe *ce_pipe = &ab->ce.ce_pipe[i];
@@ -1432,6 +1445,7 @@ static void ath12k_ahb_free_resources(struct ath12k_base *ab)
 	struct platform_device *pdev = ab->pdev;
 	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
 
+	ath12k_ahb_disable_irq(ab);
 	ath12k_hal_srng_deinit(ab);
 	ath12k_ce_free_pipes(ab);
 	ath12k_ahb_resource_deinit(ab);
diff --git a/drivers/net/wireless/ath/ath12k/ce.h b/drivers/net/wireless/ath/ath12k/ce.h
index cd913a885470..c15ec0c32374 100644
--- a/drivers/net/wireless/ath/ath12k/ce.h
+++ b/drivers/net/wireless/ath/ath12k/ce.h
@@ -11,6 +11,9 @@
 
 #define ATH12K_MSI_IRQ_CE0_OFFSET	3
 
+/* IRQ name buffer size for CE interrupts */
+#define ATH12K_CE_IRQ_NAME_LEN		32
+
 /* Byte swap data words */
 #define CE_ATTR_BYTE_SWAP_DATA 2
 
@@ -172,6 +175,7 @@ struct ath12k_ce_pipe {
 	struct ath12k_ce_ring *dest_ring;
 	struct ath12k_ce_ring *status_ring;
 	u64 timestamp;
+	char irq_name[ATH12K_CE_IRQ_NAME_LEN];
 };
 
 struct ath12k_ce {
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 293c7561b27a..21332aeb0c22 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -164,6 +164,7 @@ enum ath12k_hw_rev {
 #define ATH12K_IRQ_NUM_MAX 57
 #define ATH12K_EXT_IRQ_NUM_MAX	16
 #define ATH12K_MAX_TCL_RING_NUM	3
+#define ATH12K_MAX_MSI_VECTOR	32
 
 struct ath12k_ext_irq_grp {
 	struct ath12k_base *ab;
@@ -189,6 +190,12 @@ enum ath12k_smbios_cc_type {
 
 enum ath12k_msi_supported_hw {
 	ATH12K_MSI_CONFIG_PCI,
+
+	/*
+	 * IPCI (Integrated PCI) configuration is used by AHB devices that
+	 * support platform MSI.
+	 */
+	ATH12K_MSI_CONFIG_IPCI,
 };
 
 struct ath12k_smbios_bdf {
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index fe0939ca890c..a26fdb3c0ad2 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -51,6 +51,15 @@ const struct ath12k_msi_config ath12k_msi_config[] = {
 			{ .name = "DP", .num_vectors = 8, .base_vector = 8 },
 		},
 	},
+	{
+		.total_vectors = 32,
+		.total_users = 3,
+		.users = (const struct ath12k_msi_user[]) {
+			{ .name = "QDSS", .num_vectors = 1, .base_vector = 0 },
+			{ .name = "CE", .num_vectors = 5, .base_vector = 1 },
+			{ .name = "DP", .num_vectors = 15, .base_vector = 6 },
+		},
+	},
 };
 EXPORT_SYMBOL(ath12k_msi_config);
 
diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
index e3c8476af459..fea284c3707b 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.c
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/module.h>
+#include <linux/msi.h>
 #include "ahb.h"
 #include "core.h"
 #include "debug.h"
@@ -154,3 +155,157 @@ void ath12k_pcic_write32(struct ath12k_base *ab, u32 offset, u32 value)
 	window_start = ath12k_pcic_get_window_start(ab, offset);
 	writel_relaxed(value, ab->mem + window_start + (offset & WINDOW_RANGE_MASK));
 }
+
+static void ath12k_pcic_ce_irq_disable(struct ath12k_base *ab, u16 ce_id)
+{
+	u32 irq_idx;
+
+	irq_idx = ATH12K_MSI_IRQ_CE0_OFFSET + ce_id;
+	disable_irq_nosync(ab->irq_num[irq_idx]);
+}
+
+static irqreturn_t ath12k_pcic_ce_interrupt_handler(int irq, void *arg)
+{
+	struct ath12k_ce_pipe *ce_pipe = arg;
+	struct ath12k_base *ab = ce_pipe->ab;
+
+	if (!test_bit(ATH12K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags))
+		return IRQ_HANDLED;
+
+	/* last interrupt received for this CE */
+	ce_pipe->timestamp = jiffies;
+
+	ath12k_pcic_ce_irq_disable(ab, ce_pipe->pipe_num);
+	queue_work(system_bh_wq, &ce_pipe->intr_wq);
+
+	return IRQ_HANDLED;
+}
+
+static int ath12k_pcic_ce_irq_config(struct ath12k_base *ab,
+				     struct msi_desc **msi_desc, int num_msi)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+	int irq_idx, ret, i, vec_idx = 0;
+	u8 userpd_id = ab_ahb->userpd_id;
+	struct ath12k_ce_pipe *ce_pipe;
+	bool msi_info_captured = false;
+	struct msi_desc *desc;
+
+	for (i = 0; i < ab->hw_params->ce_count; i++) {
+		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
+			continue;
+
+		ce_pipe = &ab->ce.ce_pipe[i];
+		desc = msi_desc[vec_idx];
+		INIT_WORK(&ce_pipe->intr_wq, ath12k_pci_ce_workqueue);
+		irq_idx = ATH12K_MSI_IRQ_CE0_OFFSET + i;
+
+		scnprintf(ce_pipe->irq_name, sizeof(ce_pipe->irq_name),
+			  "pcic%u_wlan_ce_%u", userpd_id, i);
+		ret = request_irq(desc->irq, ath12k_pcic_ce_interrupt_handler,
+				  IRQF_SHARED, ce_pipe->irq_name, ce_pipe);
+		if (ret) {
+			ath12k_warn(ab, "failed to request irq %d: %d\n", irq_idx, ret);
+			ath12k_pci_free_ce_irq(ab, i);
+			return ret;
+		}
+
+		ab->irq_num[irq_idx] = desc->irq;
+		ath12k_pcic_ce_irq_disable(ab, i);
+		vec_idx = (vec_idx + 1) % num_msi;
+
+		if (!msi_info_captured) {
+			ab->msi.addr_lo = desc->msg.address_lo;
+			ab->msi.addr_hi = desc->msg.address_hi;
+			msi_info_captured = true;
+		}
+	}
+
+	return 0;
+}
+
+static void ath12k_msi_msg_handler(struct msi_desc *desc, struct msi_msg *msg)
+{
+	desc->msg.address_lo = msg->address_lo;
+	desc->msg.address_hi = msg->address_hi;
+	desc->msg.data = msg->data;
+}
+
+static int ath12k_pcic_request_msi_irqs(struct ath12k_base *ab, int base_vector,
+					int num_vectors,
+					int (*irq_config)(struct ath12k_base *ab,
+							  struct msi_desc **msi_desc,
+							  int num_msi))
+{
+	struct msi_desc *msi_vecs[ATH12K_MAX_MSI_VECTOR];
+	struct platform_device *pdev = ab->pdev;
+	struct msi_desc *msi_desc;
+	int num_msi = 0, ret;
+
+	guard(msi_descs_lock)(&pdev->dev);
+
+	msi_for_each_desc(msi_desc, &pdev->dev, MSI_DESC_ALL) {
+		if (msi_desc->msi_index < base_vector ||
+		    msi_desc->msi_index >= (num_vectors + base_vector))
+			continue;
+
+		if (num_msi >= ATH12K_MAX_MSI_VECTOR)
+			return -EOVERFLOW;
+
+		msi_vecs[num_msi++] = msi_desc;
+	}
+
+	if (!num_msi)
+		return -EINVAL;
+
+	ret = irq_config(ab, msi_vecs, num_msi);
+	if (ret) {
+		ath12k_warn(ab, "failed to config irq %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+int ath12k_pcic_config_irq(struct ath12k_base *ab)
+{
+	int user_base_data, base_vector, num_vectors;
+	struct platform_device *pdev = ab->pdev;
+	int ret;
+
+	ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_IPCI];
+
+	ret = platform_device_msi_init_and_alloc_irqs(&pdev->dev,
+						      ab->msi.config->total_vectors,
+						      ath12k_msi_msg_handler);
+	if (ret)
+		return ret;
+
+	ret = ath12k_pci_get_user_msi_assignment(ab, "CE", &num_vectors,
+						 &user_base_data,
+						 &base_vector);
+	if (ret)
+		goto free_msi;
+
+	ret = ath12k_pcic_request_msi_irqs(ab, base_vector, num_vectors,
+					   ath12k_pcic_ce_irq_config);
+	if (ret) {
+		ath12k_err(ab, "failed to config CE irq\n");
+		goto free_msi;
+	}
+
+	set_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags);
+	return 0;
+
+free_msi:
+	platform_device_msi_free_irqs_all(&pdev->dev);
+	return ret;
+}
+
+void ath12k_pcic_free_irq(struct ath12k_base *ab)
+{
+	struct platform_device *pdev = ab->pdev;
+
+	ath12k_pci_free_ce_irq(ab, ab->hw_params->ce_count);
+	platform_device_msi_free_irqs_all(&pdev->dev);
+}
diff --git a/drivers/net/wireless/ath/ath12k/pcic.h b/drivers/net/wireless/ath/ath12k/pcic.h
index f77091927039..7b6c55043618 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.h
+++ b/drivers/net/wireless/ath/ath12k/pcic.h
@@ -19,4 +19,6 @@ int ath12k_pcic_cmem_write32(struct ath12k_base *ab, u32 addr,
 			     u32 value);
 int ath12k_pcic_cmem_read32(struct ath12k_base *ab, u32 addr, u32 *value);
 void ath12k_pcic_config_static_window(struct ath12k_base *ab);
+int ath12k_pcic_config_irq(struct ath12k_base *ab);
+void ath12k_pcic_free_irq(struct ath12k_base *ab);
 #endif /* _ATH12K_PCIC_H */

-- 
2.34.1


